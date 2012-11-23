class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :ensure_domain

  private

  def ensure_domain
    if request.env['HTTP_HOST'] == "jottingjournal.com"
      redirect_to "https://www.jottingjournal.com#{request.fullpath}"
    end
  end
end
