# frozen_string_literal: true

module AccountServices
  class Onboarder
    def self.perform(user_attributes:, options: {})
      new(user_attributes, options).perform
    end

    def initialize(user_id, invite_user_to_dashboard)
      @user = User.find(user_id)
      @invite_user_to_dashboard = invite_user_to_dashboard
    end
    private_class_method :new

    def perform
      register_authy_user
      send_dashboard_invite
    end

    def register_authy_user
      return unless @user.mobile_phone.present? &&
                    Rails.env == 'production'

      Workers::RegisterAuthyUser.perform_async(@user.id)
    end

    def send_dashboard_invite
      return unless @invite_user_to_dashboard == true &&
                    Rails.env == 'production'

      AccountServices::SendDashboardInvite.call(@user)
    end
  end
end
