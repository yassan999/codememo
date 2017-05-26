class ArticlesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :show]
  
  def show
    @article = Article.find(params[:id])

  end
  
  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    
    if @article.save
      flash[:success] = '投稿しました。'
      redirect_to @article
    else
      flash.now[:danger] = "投稿できませんでした"
      render :new
    end
    
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      flash[:success] = '変更しました。'
      redirect_to @article
    else
      flash.now[:danger] = '変更できませんでした。'
      render :edit
    end
    
  end

  def destroy
    @user = current_user
    
    @article.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_to @user
  end
  
  private
  
  def article_params
    params.require(:article).permit(:comment, :title, :code)
  end
  
  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    unless @article
      redirect_to root_path
    end
  end
end
