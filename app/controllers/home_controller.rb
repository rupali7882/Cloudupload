class HomeController < ApplicationController
   before_action :authorize, only: [:index]

  def index
  end

  def dashboard
  end
end
