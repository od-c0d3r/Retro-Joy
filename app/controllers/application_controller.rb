class ApplicationController < ActionController::Base
    include SessionsHelper

    before_action :logged_in_user, only: :index

    def index
    end

    private

    def logged_in_user
        unless logged_in?
          store_location
          redirect_to login_url
        end
      end
end
