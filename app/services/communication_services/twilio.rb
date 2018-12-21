# frozen_string_literal: true

module CommunicationServices
  class Twilio
    def initialize
      @client = ::Twilio::REST::Client.new
    end

    def send_sms(to:, body:)
      from_number = fetch_availible_numbers.sample
      @client.api.account.messages.create(
        from: from_number, to: to, body: body
      )
    rescue Twilio::REST::RestError => x
      Rollbar.error(x)
    end

    private

    def fetch_availible_numbers
      numbers_list = []
      @client.api.account.incoming_phone_numbers.each do |num|
        numbers_list << num.phone_number if num.capabilities['sms']
      end
      numbers_list
    end
  end
end
