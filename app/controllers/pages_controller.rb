class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :parcours, :concept ]

  def home
  end

  def parcours
  end

  def concept
  end
end
