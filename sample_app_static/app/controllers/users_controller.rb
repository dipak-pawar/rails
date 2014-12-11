class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
  @user = User.find(params[:id])
  # Below line is used for debugger purpose using byebug gem
  #debugger
  end

  def index

  end

  def create
    @user = User.new(users_params)
    if @user.save
      flash[:sucess] = "Welcome to the sample app"
      redirect_to @user
    else
      #logger.debug "="*80
      #logger.debug "In else"
      #flash[:error] = "Something gets wrong"
      #logger.debug "rendering new"
      render 'new'
    end
  end

  private
   def users_params
    params.require(:user).permit(:name,:email,:password)
   end
end
