# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.lesmysteresdebourges.fr"
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  # Pages parcours
  add parcours_path, changefreq: 'yearly', priority: 0.9
  add a_vaillant_coeur_path, changefreq: 'yearly', priority: 0.8
  add la_grande_history_path, changefreq: 'yearly', priority: 0.8
  add tarifs_path, changefreq: 'yearly', priority: 0.8
  add horaires_path, changefreq: 'yearly', priority: 0.8
  add reservation_path, changefreq: 'yearly', priority: 0.7

  # Pages Wine Gaming
  add wine_gaming_path, changefreq: 'yearly', priority: 0.9

  # Pages annexes
  add nuitslumiere_path, changefreq: 'yearly', priority: 0.8
  add contact_path, changefreq: 'yearly', priority: 0.7
  add faq_path, changefreq: 'yearly', priority: 0.6
  add cgu_path, changefreq: 'yearly', priority: 0.1
  add mentions_legales_path, changefreq: 'yearly', priority: 0.1
  add politique_confidentialite_path, changefreq: 'yearly', priority: 0.1
  
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
