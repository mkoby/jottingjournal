class EntriesController < ApplicationController
  layout "entries"
  before_filter :authenticate_user!
  before_filter :get_entries, :only => [:index, :new, :show, :edit, :get_older_entries]
  before_filter :get_entry, :except => [:index, :new, :create, :get_favorites, :get_older_entries]

  def index
    render_layout?
  end

  def new
    @entry ||= current_user.entries.new
    @entry.build_entry_photo
    render_layout?
  end

  def create
    @entry = current_user.entries.new(params[:entry])
    attach_location

    if @entry.save
      flash[:notice] = "Entry saved."
      redirect_to entry_path(@entry)
    else
      flash[:alert] = "Oops! Something went wrong, please try agagin. If the problem persists please let us know."
      render :new
    end
  end

  def show
    render_layout?
  end

  def edit
    @entry.build_entry_photo unless @entry.entry_photo
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

  def favorite
    @entry.is_favorite = @entry.is_favorite? ? false : true

    if @entry.save
      return true
    else
      return false
    end
  end

  def get_favorites
    @favorites = current_user.entries.favorites
    render_layout?
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
      @entry.entry_location = EntryLocation.create(:latitude => params[:latitude], :longitude => params[:longitude])
    end
  end

  def render_layout?
    #Do this if we load the action via javascript
    if params['layout'] == "false"
      render(:layout => false) 
    end
  end
end
