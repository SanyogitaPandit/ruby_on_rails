class PassengerMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def thankyou_email
        @passanger = params[:passanger]
        @url  = 'http://example.com/login'
        mail(to: @passanger.email, subject: 'Thank you!')
    end
end
