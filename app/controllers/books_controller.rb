class BooksController < ApplicationController
  # 新規投稿画面
  def new
    # フォーム作成用のインスタンス変数
    @book = Book.new
  end

# 投稿機能
  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/'
  end



# 投稿一覧画面
  def index
    @books = Book.all
  end


  def show
  end

  def edit
  end
  
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end