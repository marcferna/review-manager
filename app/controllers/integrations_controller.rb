class IntegrationsController < DashboardController
  layout 'dashboard'

  def index
    @slack_integration = current_organization.slack_integration
  end
end
