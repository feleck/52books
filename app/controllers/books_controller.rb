class BooksController < ApplicationController
  before_action :set_book, only: [
    :show, :edit, :update, :destroy, :start_reading, :started_reading,
    :finish_reading, :finished_reading
  ]

  before_action :book_not_read?, only: [
    :start_reading, :finish_reading, :started_reading, :finished_reading
  ]

  before_action :book_reading_started?, only: [:start_reading, :started_reading]

  before_action :book_reading_not_started?, only: [
    :finish_reading, :finished_reading
  ]

  def index
    @books = Book.all
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to library_path
  end

  def read
    @books_read = Book.read.all
    @books = Book.started_reading.all
  end

  def start_reading; end

  def started_reading
    if params[:book][:start_reading_date].blank?
      redirect_to start_reading_book_path, alert: 'Choose the date'
    elsif @book.update_attributes(
      start_reading_date: params[:book][:start_reading_date]
    )
      redirect_to @book
    else
      render 'start_reading'
    end
  end

  def finish_reading; end

  def finished_reading
    if params[:book][:finish_reading_date].blank?
      redirect_to finish_reading_book_path, alert: 'Choose the date!'
    elsif @book.update_attributes(
      finish_reading_date: params[:book][:finish_reading_date],
      read: true
    )
      redirect_to @book
    else
      render 'finish_reading'
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(
      :title, :price, :purchase_date, :start_reading_date,
      :finish_reading_date, :bookstore_id, author_ids: []
    )
  end

  def book_not_read?
    redirect_to @book, notice: 'Book already read!' if @book.read?
  end

  def book_reading_started?
    redirect_to @book, notice: 'Already stated reading!' if
      @book.start_reading_date?
  end

  def book_reading_not_started?
    redirect_to @book, notice: 'Didn\'t start reading!' if
      !@book.start_reading_date? && !@book.read?
  end
end
