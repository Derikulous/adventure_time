class UsersController < ApplicationController

  def index
    @users = User.all.order('experience DESC')
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
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
    @user = User.find(params[:id])
    @user.life = 4
    @user.save
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :experience, :level, :life)
  end
end
