class CardsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :authenticate_user!, :except => [:index, :show]
  layout 'books'
  
  def show
    @chapter = Chapter.find(params[:chapter_id])
    @card = Card.find(params[:id])
    respond_with(@card)
  end
  
  def new
    @chapter = Chapter.find(params[:chapter_id])
    @card = @chapter.cards.new
    @book = @chapter.book
    respond_with(@card)
  end
  
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
  
  def edit
    @card = Card.find(params[:id])
    @chapter = @card.chapter
    @book = @chapter.book
  end
  
  def update
    @chapter = Chapter.find(params[:chapter_id])
    @card = Card.find(params[:id])
    
    respond_to do |format|
      if @card.update_attributes(params[:card])
        format.html { redirect_to book_chapter_path(@chapter.book, @chapter), :notice => 'Card was successfully updated.' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @card.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
