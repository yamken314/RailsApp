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

  #ユーザー編集
  def edit
    @user = User.find_by(id: params[:id]) 
  end

  #ユーザー編集（上書き）
  def update
    if params[:image]
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.image_name = "#{@user.id}.jpeg"
    image = params[:image]
    File.binwrite("public/user_images/#{@user.image_name}",image.read)
    end
    if@user.save
      redirect_to("/users/#{@user.id}")
      flash[:notice] = "ユーザー情報を編集しました"
    else
      render("users/edit")
    end
  end

  #ユーザー登録データベース保存
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      image_name: "IMG_0521.jpg"
      )
    if@user.save
      redirect_to("/users/#{@user.id}")
      flash[:notice] = "登録おめでとう！！"
    else
      render("users/new")
    end
  end

end