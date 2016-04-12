class UsersController < ApplicationController
  def new
    logger.info Time.zone
    logger.info current_user.email
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thanks for signing up!"
      
      redirect_to :back
    else
      render :new
    end
  end
  
  private
  
  def allowed_params
    params.require(:user).permit(:email, :password, :time_zone)  
  end
end
