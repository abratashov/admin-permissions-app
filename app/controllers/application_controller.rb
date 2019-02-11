class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

    def user_not_authorized(exception)
      policy_name = exception.policy.class.to_s.underscore
      error = t("#{policy_name}.#{exception.query}", scope: :pundit, default: :default)
      redirect_to(request.referrer || root_path, notice: error)
    end
end
