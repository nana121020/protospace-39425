class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_name = @user.name
    @prototypes = @user.prototypes
  end
end
