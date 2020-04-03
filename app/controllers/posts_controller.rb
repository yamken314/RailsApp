class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)#投稿一覧にデータを持って行く
  end

  def show
    @post = Post.find_by(id:params[:id])#:idから受け取った数字をparamsで受け取る
  end
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:content])
    if@post.save
      redirect_to("/posts/index")
      flash[:notice] = "新規投稿しました"
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if@post.save
      flash[:notice] = "投稿を編集しました"
    redirect_to("/posts/index")
    else
    render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
end
