class BooksController < ApplicationController
  # 新規投稿画面
  def new
    # フォーム作成用のインスタンス変数
    # モデルの新規データ（カラムの枠だけ）
    @book = Book.new
  end

# 投稿機能
  def create
    # モデルの新規データ（記入済み）
    book = Book.new(book_params)
    # 投稿成否のフラッシュメッセージ実装
    if book.save
      flash[:notice] ="successfully"
      redirect_to '/'
    else
      render :new
    end
  end

# 投稿一覧画面
  def index
    @books = Book.all
    # 投稿機能用
    @book = Book.new
  end

# 詳細画面
  def show
    # urlのidに対応したデータだけ取り出す
    @book = Book.find(params[:id])
  end

# 編集画面
  def edit
    # urlのidに対応したデータだけ取り出す
    @book = Book.find(params[:id])
  end
  
# 更新機能
  def update
    # urlのidに対応したデータだけ取り出す（記入済み）
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end