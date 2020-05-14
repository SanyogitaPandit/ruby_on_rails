class UsersController < ApplicationController
    def show
        @user = current_user
    end

    def attend
      current_user.attend(params[:event_id])
      redirect_to events_path, flash: { success: 'The event is added to attended upcoming events.' }
    end

    def do_not_attend
      current_user.do_not_attend(params[:event_id])
      redirect_to events_path, flash: { success: 'The event is removed from attended upcoming events.' }
    end
end
