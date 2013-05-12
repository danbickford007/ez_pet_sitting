class ServicesController < ApplicationController

  skip_before_filter :access_denied

  def index
  end
end
