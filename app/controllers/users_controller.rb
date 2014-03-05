class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @users = User.all.order('experience DESC')
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    check_user
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def revive
    current_user.life = 4
    if current_user.experience >= 1000
      current_user.experience -= 1000
    else
      current_user.experience =0
    end
    if current_user.save
      flash[:notice] = "You have been successfully revived! Life has been set to 4, experience has been decreased by 1000"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def check_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to @user, notice: 'Not Authorized to edit profile of this user'
    end
  end
end
