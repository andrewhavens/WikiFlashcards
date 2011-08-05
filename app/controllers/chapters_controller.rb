class ChaptersController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :authenticate_user!, :except => [:index, :show]
  layout 'books'
  
  def index
    @book = Book.find(params[:book_id])
    @chapters = @book.chapters.all
    respond_with(@chapters)
  end
  
  def show
    @book = Book.find(params[:book_id])
    @chapter = Chapter.find(params[:id])
    @card = @chapter.cards.new #for new card modal
    @card_versions = CardVersion.where('chapter_id = ?', @chapter.id).order('created_at DESC')
    respond_with(@chapter)
  end
  
  def new
    @book = Book.find(params[:book_id])
    @chapter = @book.chapters.new
    respond_with(@chapter)
  end
  
  def create
    @book = Book.find(params[:book_id])
    @chapter = @book.chapters.create(params[:chapter])
    redirect_to book_path(@book)    
  end
  
  def edit
    @chapter = Chapter.find(params[:id])
    @book = @chapter.book
  end
  
  def update
    @chapter = Chapter.find(params[:id])

    respond_to do |format|
      if @chapter.update_attributes(params[:chapter])
        format.html { redirect_to book_chapter_path(@chapter.book, @chapter), :notice => 'Chapter was successfully updated.' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chapter.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy

    respond_to do |format|
      format.html { redirect_to(chapters_url) }
      format.xml  { head :ok }
    end
  end
  
  def quiz
    @chapter = Chapter.find(params[:id])
    @book = @chapter.book
    @cards = @chapter.cards
    #respond_with(@cards)
    render :layout => 'quiz'
  end
  
  def history
    @chapter = Chapter.find(params[:id])
    @book = @chapter.book
    @card_versions = CardVersion.where('chapter_id = ?', params[:id]).order('created_at DESC')
  end
end
