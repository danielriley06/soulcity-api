# frozen_string_literal: true

module Account
  class SendDashboardInvite
    def call(user)
      if user.email.present?
        Workers::SendDashboardInviteEmail.perform_async(user.id)
      elsif user.cellphone.present?
        Workers::SendDashboardInviteSms.perform_async(user.id)
      else
        raise 'An account must have a valid email or cellphone number'
      end
    end
  end
end
