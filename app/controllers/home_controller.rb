class HomeController < ApplicationController
  def index
  end
  
  def search
    @search = params[:search]
    @books = Book.search(@search)
    #@schools = School.search(params[:search])
  end
end
