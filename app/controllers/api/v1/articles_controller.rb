module Api
    module V1
class ArticlesController < ApplicationController
    def index

    # @articles = Article.all
    # render json: @articles
            # or
    render json: Article.all
  
  end
  
  def show
  
    # @article = Article.find(params[:id])
    render json: Article.find(params[:id])

  end

  def create

    @article = Article.new(article_params)
  
    if @article.save
  
      render json: @article, status: :created
  
    else
  
      render json: @article.errors, status: :unprocessable_entity
  
    end
  
  end
  def update

    @article = Article.find(params[:id])
  
    if @article.update(article_params)
  
      head :no_content
  
    else
  
      render json: @article.errors, status: :unprocessable_entity
  
     end
  
  end
  def destroy

    @article = Article.find(params[:id])
  
    if @article.destroy
  
      head :no_content
  
    else
  
      render json: @article.errors, status: :unprocessable_entity
  
    end
  
  end
  private
def article_params

    params.permit(:title, :body)

end
end
end
end