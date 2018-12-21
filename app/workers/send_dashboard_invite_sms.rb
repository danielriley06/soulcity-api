# frozen_string_literal: true

module Workers
  class SendDashboardInviteSms
    include Sidekiq::Worker

    def perform(user_id)
      user = User.find(user_id)
      link = Bitly.client.shorten(
        "#{Rails.application.credentials[Rails.env.to_sym][:client_url]}/invite/#{user.invite_token}"
      )
      to = Phonelib.parse(user.cellphone).full_e164
      body =
        "You have been invited to the Soulcity Dashboard, to accept click here: #{link}"
      CommunicationServices::Twilio.send_sms(to: to, body: body)
    end
  end
end
