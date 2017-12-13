class HerokuController < ApplicationController
  def ping
    head :no_content
  end
end
