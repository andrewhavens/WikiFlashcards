class MyBooksController < ApplicationController
	respond_to :html, :xml, :json
  before_filter :authenticate_user!
	
  # GET /my_books
  # GET /my_books.xml
  def index
  	#find just the books that is saved in user preferences
    @books = current_user.books.all
		respond_with(@books)
  end
  
  def new
    @my_book = MyBook.new
    respond_with(@my_book)
  end

  # POST /my_books
  # POST /my_books.xml
  def create
  	@book = Book.find(params[:book_id])

    respond_to do |format|
      if current_user.books << @book
        format.html { redirect_to(@book, :notice => 'Book was added to your bookmarked books.') }
        format.xml  { render :xml => @book, :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => current_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /my_books/1
  # DELETE /my_books/1.xml
  def destroy
    @my_book = MyBook.find(params[:id])
    @my_book.destroy

    respond_to do |format|
      format.html { redirect_to(my_books_url) }
      format.xml  { head :ok }
    end
  end
end
