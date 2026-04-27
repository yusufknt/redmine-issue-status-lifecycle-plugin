Redmine::Plugin.register :issue_status_lifecycle do
  name 'Issue Status Lifecycle'
  author 'Yusuf'
  description 'Shows issue status lifecycle durations per project'
  version '0.0.1'

  project_module :issue_status_lifecycle do
    permission :view_issue_status_lifecycle, {
      issue_status_lifecycle: [:index]
    }
  end

  menu :project_menu,
       :issue_status_lifecycle,
       { controller: 'issue_status_lifecycle', action: 'index' },
       caption: 'Status Lifecycle',
       after: :issues,
       param: :project_id
end
