class ApplicationController < ActionController::Base
    def authenticate_user! (opts={})
        if user_signed_in?
          super
        else
          redirect_to new_user_registration_path
        end
    end
end
