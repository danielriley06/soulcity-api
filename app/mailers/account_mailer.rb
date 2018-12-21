# frozen_string_literal: true

class AccountMailer < ApplicationMailer
  default from: 'welcome@soulcitysoccer.com'

  def dashboard_invite(user)
    mail(to: user.email, subject: 'Soulcity Soccer Dashboard Invite')
  end
end
