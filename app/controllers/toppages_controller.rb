class ToppagesController < ApplicationController
  def index
    if logged_in?
      @tasks = current_user.tasks.order('created_at DESC')
    end
  end
end
