class HomeController < ApplicationController
  def index
  end
  
  def search
    @search = params[:search]
    @books = Book.search(@search)
    session[:recent_search_path] = request.url #save recent search for later retrieval
  end
end
