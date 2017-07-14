class RoutesController < ApplicationController

  def root
    if current_user
      redirect_to user_path(current_user)
    else
      redirect_to welcome_index_path
    end
  end
end
