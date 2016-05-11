class AppsController < DashboardController
  layout 'dashboard'

  def index
    @apps = current_user.organization.apps.decorate
  end
end
