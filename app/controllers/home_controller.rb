class HomeController < ApplicationController

  def index
  end

  def howitworks
  end

  def dashboard
    @message = Message.new
  end

end
