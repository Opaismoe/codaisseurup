class UsersController < ApplicationController
  has_one :profile

  def show
    @user = User.find(params[:id])
  end

  def full_name
    return profile.full_name if profile?

    email
  end

  def profile?
    profile.present? && profile.persisted?
  end
end
