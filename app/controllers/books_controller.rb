class BooksController < ApplicationController  
  respond_to :html, :xml, :json
  before_filter :authenticate_user!, :except => [:index, :show]

  def show
    @book = Book.find(params[:id])
    @chapter = Chapter.new #for new chapter modal
    @chapter.book_id = @book.id
    respond_with(@book)
  end

  def new
    @book = Book.new
    respond_with(@book)
    render :layout => 'application'
  end

  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to(@book, :notice => 'Book was successfully created.') }
        format.xml  { render :xml => @book, :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @book = Book.find(params[:id])
    @chapter = @book.chapters.new #for sidebar
    render :layout => 'application'
  end
  
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to(@book, :notice => 'Book was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to(books_url) }
      format.xml  { head :ok }
    end
  end
end
