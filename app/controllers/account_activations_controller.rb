class AccountActivationsController < ApplicationController
	def edit
    user = User.find_by(email: params[:email])
     if user && !user.avtivated? && user.authenticated?(:activation, params[:id])
      user.update_attribute(:avtivated,    true)
      user.update_attribute(:avtivated_at, Time.zone.now)
      #user.avtivate
      log_in user
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
