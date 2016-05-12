class AppsController < DashboardController
  layout 'dashboard'

  def index
    @apps = current_organization.apps.decorate
  end

  def new
    @app = current_organization.apps.new
  end

  def create
    if current_organization.apps.create(app_params)
      redirect_to(apps_path, notice: notice)
    else
      redirect_to(new_app_path, alert: alert)
    end
  end

  private

  def app_params
    params.require(:app).permit(:name, :type, :uid)
  end

  def notice
    'App created successfully!'
  end

  def alert
    'There was an error creating creating the app, please try again'
  end
end
