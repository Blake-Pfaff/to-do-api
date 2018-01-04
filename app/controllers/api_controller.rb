class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

    private

    def authenticated?
      authenticate_or_request_with_http_basic do |email, password|
        # User.present?
        @current_user = User.find_by(email: email, password: password)
        # Step 1: Set user to an instance named current_user
        @current_user.present?
        # Step 2: Assert if current_user is present.
      end
    end

    def current_user
      @current_user
    end

end
