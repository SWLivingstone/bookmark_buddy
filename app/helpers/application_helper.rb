module ApplicationHelper

  def authenticate
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
