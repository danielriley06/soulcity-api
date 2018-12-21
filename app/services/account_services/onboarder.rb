# frozen_string_literal: true

module AccountServices
  class Onboarder
    def self.perform(user_attributes:, options: {})
      new(user_attributes, options).perform
    end

    def initialize(user_attributes, options)
      @user_attributes = user_attributes
      @options = options
    end
    private_class_method :new

    def perform
      @user = User.new(@user_attributes)
      generate_invite_token
      @user.save!
      register_authy_user
      send_dashboard_invite
    end

    def generate_invite_token
      @user.invite_token = SecureRandom.hex(20).encode('UTF-8')
    end

    def register_authy_user
      return unless @user.mobile_phone.present? &&
                    Rails.env == 'production'

      Workers::RegisterAuthyUser.perform_async(@user.id)
    end

    def send_dashboard_invite
      return unless @options[:invite_user_to_dashboard] == true &&
                    Rails.env == 'production'

      AccountServices::SendDashboardInvite.call(@user)
    end
  end
end
