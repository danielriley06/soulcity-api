# frozen_string_literal: true

module Workers
  class SendDashboardInviteEmail
    include Sidekiq::Worker

    def perform(user_id)
      user = User.find(user_id)
      AccountMailer.dashboard_invite(user).deliver_now
    end
  end
end
