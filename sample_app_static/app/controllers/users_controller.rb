class UsersController < ApplicationController
  def new
  end

  def show
  @user = User.find(params[:id])
# Below line is used for debugger purpose
  #debugger
  end

end
