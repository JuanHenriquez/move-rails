class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]
    before_action :update_status_offline, only: [:destroy]
    after_action :update_status_active, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

    # POST /resource/sign_in
    # def create
    #    super
    # end

    # DELETE /resource/sign_out
    # def destroy
    #    super
    # end

  protected

  def update_status_active
      user = User.find_by_email(params[:user][:email])
      user.status = true
      user.save
      Rails.logger.info(user.errors.inspect)
  end

  def update_status_offline
      current_user.update(status: false)
      Rails.logger.info(current_user.errors.inspect)
  end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
