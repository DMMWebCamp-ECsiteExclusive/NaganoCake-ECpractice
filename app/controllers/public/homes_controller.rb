class Public::HomesController < ApplicationController

  def top
    @genre = params[:genre_name]
  end

  def about
  end
end
