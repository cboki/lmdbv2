class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :parcours, :a_vaillant_coeur, :tarifs, :reservation, :nuitslumiere, :faq, :contact, :cgu, :mentions_legales, :politique_confidentialite ]

  def home
  end

  def parcours
  end

  def a_vaillant_coeur
  end

  def tarifs
  end

  def reservation
  end
  
  def nuitslumiere
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
