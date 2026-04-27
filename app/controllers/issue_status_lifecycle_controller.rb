class IssueStatusLifecycleController < ApplicationController
  before_action :find_project

  def index
    authorize
    @issues_data = build_issue_lifecycle_data
    @user_stats = build_user_stats(@issues_data)
    @category_stats = build_category_stats(@issues_data)
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def build_issue_lifecycle_data
    issues = @project.issues.includes(:journals, :status, :tracker, :assigned_to, :category)

    issues.map do |issue|
      history = extract_status_history(issue)
      total_duration = history.sum { |h| h[:duration] }

      {
        id: issue.id,
        subject: issue.subject,
        category: issue.category&.name || 'Yok',
        history: history,
        total_duration: total_duration,
        total_duration_text: format_duration(total_duration)
      }
    end
  end

  def extract_status_history(issue)
    history = []
    journals = issue.journals.includes(:details, :user).order(:created_on)

    last_time = issue.created_on

    journals.each do |journal|
      journal.details.each do |detail|
        next unless detail.prop_key == 'status_id'

        old_status = IssueStatus.find_by(id: detail.old_value)
        new_status = IssueStatus.find_by(id: detail.value)

        duration = journal.created_on - last_time

        history << {
          from: old_status&.name || 'Initial',
          to: new_status&.name,
          duration: duration,
          duration_text: format_duration(duration),
          user: journal.user&.name || 'Unknown',
          changed_at: journal.created_on
        }

        last_time = journal.created_on
      end
    end

    history
  end

  def build_user_stats(issues_data)
    stats = Hash.new(0)

    issues_data.each do |issue|
      issue[:history].each do |h|
        stats[h[:user]] += h[:duration]
      end
    end

    stats.map do |user, total|
      {
        user: user,
        total: total,
        total_text: format_duration(total)
      }
    end
  end

  def build_category_stats(issues_data)
    stats = Hash.new(0)

    issues_data.each do |issue|
      issue[:history].each do |h|
        stats[issue[:category]] += h[:duration]
      end
    end

    stats.map do |category, total|
      {
        category: category,
        total: total,
        total_text: format_duration(total)
      }
    end
  end

  def format_duration(seconds)
    seconds = seconds.to_i

    if seconds < 60
      "#{seconds} sn"
    elsif seconds < 3600
      "#{seconds / 60} dk"
    elsif seconds < 86_400
      "#{seconds / 3600} saat"
    else
      "#{seconds / 86_400} gün"
    end
  end
end