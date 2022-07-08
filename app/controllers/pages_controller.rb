class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :parcours, :a_vaillant_coeur,:la_grande_history, :tarifs, :reservation, :wine_gaming, :nuitslumiere, :faq, :contact, :cgu, :mentions_legales, :politique_confidentialite ]

  def home
  end

  def parcours
  end

  def a_vaillant_coeur
  end

  def la_grande_history
  end

  def tarifs
  end

  def reservation
  end
  
  def wine_gaming
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
