class WelcomeController < ApplicationController
  def index
  	@user=User.all
  	@posts=Post.all
  end
end
