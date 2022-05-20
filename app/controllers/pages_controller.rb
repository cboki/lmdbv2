class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :parcours, :concept, :tarifs, :cgu, :mentions_legales, :politique_confidentialite ]

  def home
  end

  def parcours
  end

  def concept
  end

  def tarifs
  end

  def cgu
  end

  def mentions_legales
  end

  def politique_confidentialite
  end
end
