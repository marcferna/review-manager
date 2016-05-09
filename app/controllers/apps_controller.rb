class AppsController < DashboardController
  layout 'dashboard'

  def index
    @apps = current_user.apps.decorate
  end
end
