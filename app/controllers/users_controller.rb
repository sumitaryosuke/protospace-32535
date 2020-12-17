class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # @use_name = @user.user_name
    @prototypes = @user.prototypes
  end
end
