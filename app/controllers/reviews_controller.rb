class ReviewsController < DashboardController
  layout 'dashboard'

  before_action :check_app_presence
  before_action :check_app_user_ownership

  def index
    @reviews = app.reviews.order(created_at: :desc).decorate
  end

  private

  def app
    @app ||= App.find_by(id: params[:app_id])
  end

  def check_app_presence
    redirect_to authenticated_root_path, alert: alert if app.nil?
  end

  def check_app_user_ownership
    if app.user != current_user
      redirect_to authenticated_root_path, alert: alert
    end
  end

  def alert
    "Sorry, the app you are trying to find doesn't exist"
  end
end
