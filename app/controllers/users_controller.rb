# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      authy = Authy::API.register_user(
        email: user.email,
        cellphone: user.phone_number,
        country_code: user.country_code
      )
      user.update(authy_id: authy.id)

      Authy::API.request_sms(id: user.authy_id) if params[:verify]

      render json: user.as_json, status: :created
    else
      render json: { error: { message: 'Unable to create user' } }, status: 500
    end
  end

  def send_mobile_verification
    phone = Phonelib.parse(
      authy_params.fetch(:mobile_number),
      authy_params.fetch(:mobile_number_country_code)
    )
    user = User.find_by!(cellphone: phone.sanitized)
    if user && phone.valid?
      Authy::API.request_sms(id: user.authy_id)
      render json: {}, status: :ok
    else
      render json: { error: { message: 'Invalid mobile number' } }, status: 401
    end
  end

  def verify
    user = current_user

    # Use Authy to send the verification token
    token = Authy::API.verify(id: user.authy_id, token: params[:token])

    if token.ok?
      user.update(cellphone_verified: true)
      render json: user.as_json, status: :ok
    else
      render json: { error: { message: 'Unable to create user' } }, status: 500
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :first_name,
      :last_name,
      :country_code,
      :phone_number
    )
  end

  def authy_params
    :mobile_number,
    :mobile_number_country_code,
    :verification_token
  end
end
