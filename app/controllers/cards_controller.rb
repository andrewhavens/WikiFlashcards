class CardsController < ApplicationController
  respond_to :html, :xml, :json
  
  def create
    @chapter = Chapter.find(params[:chapter_id])
    @card = @chapter.cards.create(params[:card])
    redirect_to book_chapter_path(@chapter.book, @chapter)
  end
  
  def destroy
    @chapter = Chapter.find(params[:chapter_id])
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to book_chapter_path(@chapter.book, @chapter)
  end
  
end
