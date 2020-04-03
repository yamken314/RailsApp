class UsersController < ApplicationController
  #ユーザー一覧
  def index
    @users = User.all
  end
  
  #ユーザー詳細
  def show
    @user = User.find_by(id: params[:id])
  end

  #ユーザー登録画面
  def new
    @user = User.new
  end

  #ユーザー登録データベース保存
  def create
    @user = User.new(name: params[:name],email: params[:email])
    if@user.save
      redirect_to("/users/#{@user.id}")
      flash[:notice] = "登録おめでとう！！"
    else
      render("users/new")
    end
  end
end
