# frozen_string_literal: true

class UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token
  # Inherited Knock Controller

  # before_action :authenticate

  def create
    render json: auth_token, status: :created
  end

  private

  def authenticate
    unless entity.present? && entity.authenticate(auth_params[:password])
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  # def auth_token
  #   if entity.respond_to? :to_token_payload
  #     AuthToken.new payload: entity.to_token_payload
  #   else
  #     AuthToken.new payload: { sub: entity.id }
  #   end
  # end

  # def entity
  #   @entity ||=
  #     if entity_class.respond_to? :from_token_request
  #       entity_class.from_token_request request
  #     else
  #       entity_class.find_by email: auth_params[:email]
  #     end
  # end

  # def entity_class
  #   entity_name.constantize
  # end

  # def entity_name
  #   self.class.name.scan(/\w+/).last.split('TokenController').first
  # end

  # def auth_params
  #   params.require(:auth).permit :email, :password
  # end
end
