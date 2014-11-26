class UsersController < ApplicationController


  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @stream = Stream.new
    @streams = Stream.where(:user_id => @user.id)
  end

  def edit
  end

  def index
    @users = User.all
    @stream = Stream.new
  end

def create
    @user = User.new(user_params)

    # respond_to do |format|
      if @user.save
          session[:user_id] = @user.id.to_s
          redirect_to user_path(@user)       

       else
        redirect_to root_path
      #   format.html { render :new }
      #   format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  





  def update
    @user.update_attributes(user_params)
  end

  def destroy
    user.destroy
  end

  private

  def set_user
      @user = User.find(params[:id])
    end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end

