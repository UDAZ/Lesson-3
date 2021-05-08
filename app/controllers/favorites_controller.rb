class FavoritesController < ApplicationController
    
    def create
        @book = Book.find(params[:book_id])
        favorite = current_user.favorites.build(book_id: params[:book_id])
        favorite.save
        redirect_to request.referer
    end
    
    def destroy
        @book = Book.find(params[:book_id])
        favorite = current_user.favorites.find_by(book_id: params[:book_id], user_id: current_user.id)
        favorite.destroy
        redirect_to request.referer
    end
    
end