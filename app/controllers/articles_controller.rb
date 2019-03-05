class ArticlesController < ApplicationController
  include Pagy::Backend

  def index
    @articles = Article.includes(:author).active
    @articles = @articles.search_with_params(params) unless params[:title].blank?
    @articles = @articles.where(author_id: params[:author_id]) unless params[:author_id].blank?
    
    if params[:status] == "published"
      @articles = @articles.published
    elsif params[:status] == "draft"
      @articles = @articles.draft
    end
    @pagy, @articles = pagy(@articles)
  end
end
