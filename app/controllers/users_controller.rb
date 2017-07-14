class UsersController < ApplicationController
  include ApplicationHelper
  before_action :authenticate
  
  def show
    @user = current_user
  end
end
