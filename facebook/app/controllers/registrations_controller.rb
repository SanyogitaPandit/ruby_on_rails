class RegistrationsController < Devise::RegistrationsController
    
    def create
        super
        UserMailer.admin_approval_email(@user).deliver_now #This is the line we are adding
    end
    
private
    def sign_up_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def account_update_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
    end
end