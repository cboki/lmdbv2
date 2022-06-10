class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :parcours, :tarifs, :faq, :contact, :cgu, :mentions_legales, :politique_confidentialite ]

  def home
  end

  def parcours
  end

  def tarifs
  end

  def faq
  end

  def contact
  end

  def cgu
  end

  def mentions_legales
  end

  def politique_confidentialite
  end
end
