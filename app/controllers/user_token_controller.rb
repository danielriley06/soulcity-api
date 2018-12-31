# frozen_string_literal: true

class UserTokenController < ApplicationController
  attr_reader :user
  before_action :set_entity, :authenticate

  def create
    render json: { jwt: auth_token }.as_json, status: :created
  end

  private

  def authenticate
    rendor_error unless @user.authenticate(auth_params[:password])
  end

  def set_entity
    @user = User.find(email: auth_params[:email])
  end

  def rendor_error
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

  def auth_token
    AuthToken.encode(payload: @user.to_token_payload)
  end

  def auth_params
    params.require(:auth).permit(:email, :password)
  end
end
