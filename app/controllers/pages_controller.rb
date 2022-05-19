class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :parcours ]

  def home
  end

  def parcours
  end
end
