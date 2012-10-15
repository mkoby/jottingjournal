class EntriesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @entry ||= current_user.entries.new
  end

  def create
    @entry = current_user.entries.new(params[:entry])

    if @entry.save
      flash[:notice] = "Entry saved"
      redirect_to root_path
    else
      flash[:alert] = "Oops! Something went wrong, please try agagin. If the problem persists please let us know."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
