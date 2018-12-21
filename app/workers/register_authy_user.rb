# frozen_string_literal: true

module Workers
  class RegisterAuthyUser
    include Sidekiq::Worker

    def perform(user_id)
      @user = User.find(user_id)
      @phone = Phonelib.parse(@user.mobile_number)
      @authy = Authy::API.register_user(
        email: email,
        cellphone: @phone.national(false),
        country_code: @phone.country_code
      )
      @user.update!(authy_id: @authy.id)
    rescue StandardError => error
      Rollbar.error(error)
      true
    end
  end
end
