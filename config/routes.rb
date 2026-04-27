Rails.application.routes.draw do
  get 'projects/:project_id/issue_status_lifecycle',
      to: 'issue_status_lifecycle#index',
      as: 'project_issue_status_lifecycle'
end
