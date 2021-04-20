class UsersController < ApplicationController


    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
           flash[:notice] = "Create successfully"
           redirect_to book_path(@book.id)
        else


        end
    end


    def show
        @book = Book.new
        @user = User.find(params[:id])
        @books = @user.books.reverse_order
    end

    def index
        @book = Book.new
        @users = User.all
    end

    def edit
        @user = User.find(params[:id])
        redirect_to user_path(current_user.id) unless current_user.id == @user.id
    end

    def update
        @user = User.find(params[:id])
       if  @user.update(user_params)
           flash[:notice] = "Update successfully"
           redirect_to user_path(@user.id)
       else
          render :edit
       end
    end

    private

    def user_params
        params.require(:user).permit(:name,:introduction,:profile_image_id,)
    end
end
