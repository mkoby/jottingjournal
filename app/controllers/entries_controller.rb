class EntriesController < ApplicationController
  layout "entries"
  before_filter :authenticate_user!
  before_filter :get_entries, :only => [:index, :new, :show, :edit]
  before_filter :get_entry, :only => [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @entry ||= current_user.entries.new
  end

  def create
    @entry = current_user.entries.new(params[:entry])
    attach_location

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
    if @entry.update_attributes(params[:entry])
      flash[:notice] = "Entry updated."
      redirect_to entry_path(@entry)
    end
  end

  def destroy
    @entry.destroy
    redirect_to root_path
  end

  private

  def get_entries
    @entries = current_user.entries.reverse
  end

  def get_entry
    @entry = Entry.find(params[:id])
  end

  def attach_location
    attach_location = params[:attach_location?].to_i

    if attach_location && attach_location == 1
      @entry.location = EntryLocation.create(:latitude => params[:latitude], :longitude => params[:longitude])
    end
  end
end
