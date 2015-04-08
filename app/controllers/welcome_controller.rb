class WelcomeController < ApplicationController
  def index
  	@user=User.all
  	@posts=Post.all
  end

  def about
  end

  def help
  end
  
end
