class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def show
  end

  def dashboard
    @profile=Profile.find_by(user_id: current_user.id)
    @slides=Slide.find_slides(current_user.id)
  end

  def update
    @profile.update(profile_params)
    if @profile.valid?
      redirect_to root_path
    else
      flash[:notice] = {error: ["You are not the admin"]}
      redirect_to root_path
    end
  end

  private

  def set_profile
    @profile=Profile.find_by(user_id: params[:user_id])
    @user=@profile.user
  end

  def profile_params
    params.require(:profile).permit(:user_name, :bio, :full_name, :age)
  end

end
