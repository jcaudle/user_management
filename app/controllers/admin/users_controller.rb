module Admin
  class UsersController < ApplicationController
    before_action :user_params, only: :update
    before_action :authenticate_user!
    load_and_authorize_resource

    def index
      @users = User.all
    end

    def show
      @user = User.find params[:id]
    end

    def update
      @user = User.find params[:id]
      @user.abilities = params[:user][:abilities]

      if @user.save
        flash[:notice] = "Abilities updated!"
        redirect_to admin_user_path @user
      end
    end

    private

    def user_params
      params.require(:user).permit(abilities: [])
    end
  end
end
