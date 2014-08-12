class TitlesController < ApplicationController
  def show
    @title = Title.find(params[:id])
  end
end
