# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
#  before_action :configure_sign_up_params, only: [:create]
#  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end


  def edit_place_and_radius
    if current_user == nil
      flash[:alert] = "You need to sign in to access the gardens"
      redirect_to user_session_path
    else
    @user = current_user
  end
  end

  def update_place_and_radius
    if @address.blank?
      @address = request.location.coordinates
      #>>>>> LA GEOLOCALISATION NE MARCHE PAS POUR LE MOMENT (NOUS SITUE A PARIS AUTOMATIQUEMENT)
    current_user.update(user_params)
  else
    current_user.update(user_params)

  end
    flash[:success] = 'Your location and search radius have been updated'
    redirect_to gardens_path
  end

  def update
    current_user.update(user_params)
    flash[:success] = 'Your profile has been updated.'
    redirect_to profile_path
  end

 private

 def user_params
  params.require(:user).permit(:email, :address, :search_radius)
 end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
