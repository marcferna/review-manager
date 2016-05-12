class SlackIntegrationsController < DashboardController
  layout 'dashboard'

  def new
    @slack_integration = current_organization.build_slack_integration
  end

  def create
    if current_organization.create_slack_integration(integration_params)
      redirect_to(integrations_path, notice: notice)
    else
      redirect_to(new_slack_integration_path, alert: alert)
    end
  end

  private

  def integration_params
    params.require(:integration_slack).permit(:webhook_url, :channel, :active)
  end

  def notice
    'Integraion created successfully!'
  end

  def alert
    'There was an error creating creating the integraion, please try again'
  end
end
