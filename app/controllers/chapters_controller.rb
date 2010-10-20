class ChaptersController < ApplicationController
  respond_to :html, :xml, :json
  
  def show
    @book = Book.find(params[:book_id])
    @chapter = Chapter.find(params[:id])
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
  
  def update
    @chapter = Chapter.find(params[:id])

    respond_to do |format|
      if @chapter.update_attributes(params[:chapter])
        format.html { redirect_to(@chapter, :notice => 'Chapter was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chapter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.xml
  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy

    respond_to do |format|
      format.html { redirect_to(chapters_url) }
      format.xml  { head :ok }
    end
  end
end
