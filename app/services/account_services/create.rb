# frozen_string_literal: true

module AccountServices
  class Create
    def self.perform(user_attributes:)
      new(user_attributes).perform
    end

    def initialize(user_attributes)
      @invite_user_to_dashboard = user_attributes.extract!(:invite_user_to_dashboard)
      @user_attributes = user_attributes
      onboard_user
    end
    private_class_method :new

    def perform
      @user = User.new(@user_attributes)
      generate_invite_token
      @user.save!
      register_user_household
    end

    def generate_invite_token
      @user.invite_token = SecureRandom.hex(20).encode('UTF-8')
    end

    def register_user_household
      return if @user.household_id.blank?

      household = Household.create!(name: @user.last_name, head_of_household: @user.id)
      @user.update!(household_id: household.id)
    end

    def onboard_user
      AccountServices::Onboarder.perform(
        user_id: @user.id,
        invite_user_to_dashboard: @invite_user_to_dashboard
      )
    end
  end
end
