get "/" do
      begin
       @books = Book.all
     rescue ActiveRecord::NoMethodError => e
       @books = nil
     end
      erb :index
end


post "/" do
  @books = Book.new(params[:book])
 if @books.save
 	@books = Book.all
   erb :index
 else
@books = Book.all
 erb :index
end
end

get "/:id" do
       begin
          @user = User.find(params[:id])
             begin
               @books = Book.all
             rescue ActiveRecord::NoMethodError => e
               @books = nil
             end
              erb :user
       rescue ActiveRecord::RecordNotFound => e
               @user = nil
       end
       erb :user
end

get "/:user_id/:book_id" do
  begin
    @user = User.find(params[:user_id])
      begin
        @books = Book.find(params[:book_id])
        @books_users = BooksUsers.new(:book_id => params[:book_id], :user_id => params[:user_id])
        @books_users.save
      rescue ActiveRecord::RecordNotFound => e
        @books = nil
      end
  rescue ActiveRecord::RecordNotFound => e
    @user = nil
  end
  @favourites = BooksUsers.all
  erb :booksToUsers
end
