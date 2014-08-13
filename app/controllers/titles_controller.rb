class TitlesController < ApplicationController
  def show
    @title = Title.find(params[:id])
  end

  def index
    @titles = Title.order(:title)
    @titles = @titles.genre(params[:genre]) if params[:genre]
    @titles = @titles.page(params[:page])
    @genres = TitleInfo.genres.distinct.pluck(:info)
  end

  def send_to_a_friend
    @title = Title.find(params[:id])
    SendToFriendMailer.send_title_to_friend(@title, params[:email])
    redirect_to @title
  end
end
