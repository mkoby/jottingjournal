class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :ensure_domain

  private

  def ensure_domain
    if request.env['HTTP_HOST'] == "jottingjournal.com"
      redirect_to_full_url "//www.jottingjournal.com#{request.request_uri}", 301
    end
  end
end
