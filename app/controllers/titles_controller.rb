class TitlesController < ApplicationController
  def show
    @title = Title.find(params[:id])
  end

  def index
    @titles = Title.order(:title)
    @titles = @titles.genre(params[:genre]) if params[:genre]
    @titles = @titles.page(params[:page])
  end
end
