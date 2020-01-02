class StaticPagesController < ApplicationController
  def home
    # Different home view if there is a logged user
    if logged_in?
      @micropost = Micropost.new

      # To be updated after follow function
      @microposts = current_user.microposts.order(created_at: :desc).paginate(page: params[:page], per_page: 10)

      render 'users/home_feed'
    end
  end

  def about
    
  end
end
