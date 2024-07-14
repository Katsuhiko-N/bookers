class BooksController < ApplicationController
  # 新規投稿画面
  def new
    # フォーム作成用のインスタンス変数
    @book_new = Book.new
  end

# 投稿機能
  def create
    book = Book.new(book_params)
    # 投稿成否のフラッシュメッセージ実装
    if book.save
      flash[:notice] ="a"
      redirect_to '/'
    else
      render :new
    end
  end



# 投稿一覧画面
  def index
    @books = Book.all
    # 投稿機能用
    @book_new = Book.new
  end

# 詳細画面
  def show
    @book = Book.find(params[:id])
  end

  def edit
  end
  
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end