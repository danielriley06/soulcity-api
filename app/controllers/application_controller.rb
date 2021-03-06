# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Knock::Authenticable
  include Concerns::SetCurrentHostForDiskService
  include Response
  include ExceptionHandler
end
