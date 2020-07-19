class ApplicationController < ActionController::Base
    def authenticate_user! (opts={})
        if user_signed_in?
          super
        else
          redirect_to new_user_registration_path
        end
    end

    def new_session_path(scope)
      new_user_session_path
    end
end
