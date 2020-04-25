class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    avator_paths = @users.to_a.map do |user|
      Rails.application.routes.url_helpers.rails_blob_path(user.avatar, only_path: true)
    end
    puts "Avator Paths(#{avator_paths.size}):\n#{avator_paths.join("\n")}"
  end

  def new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :avatar, images: []))
    @user.save
    redirect_to @user
  end
end
