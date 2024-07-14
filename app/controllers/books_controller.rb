class BooksController < ApplicationController
  def new
  end

# 投稿一覧画面
  def index
    @books = Book.all
  end

  def show
  end

  def edit
  end
end
