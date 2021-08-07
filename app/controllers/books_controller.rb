class BooksController < ApplicationController
  def index
    @bookers = Booker.all
    @booker = Booker.new
  end

  def show
    @booker = Booker.find(params[:id])
  end

  def edit
    @booker = Booker.find(params[:id])
  end
  
  def update
    @booker = Booker.find(params[:id])
    if @booker.update(booker_params)
      flash[:success]="Book was successfully updated."
      redirect_to "/books/#{@booker.id}"
    else
      render :edit
    end
  end

  def create
    @booker = Booker.new(booker_params)
    if @booker.save
      redirect_to "/books/#{@booker.id}"
      flash[:success]="Book was successfully created."
    else
      @bookers= Booker.all
      render :index
    end
  end

  def destroy
    booker = Booker.find(params[:id])
    booker.destroy
    flash[:success] = "Book was successfully destroyed."
    redirect_to "/books"
  end


  private
  def booker_params
    params.require(:booker).permit(:title, :body)
  end
end
