# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Game.create!(name:'A vaillant coeur', players_min:2, duration:149, simultaneous_start: false)
Game.create!(name:'La grande history', players_min:3, duration:149, simultaneous_start: true)

avc = Game.first
gt = Game.last

['rouge', 'jaune', 'vert', 'bleu', 'violet'].each { |color| Bag.create!(color: color, game: avc, status:'ok') }
['rouge', 'jaune', 'vert', 'bleu', 'violet'].each { |color| Bag.create!(color: color, game: gt, status:'ok') }

Contact.create!(email:'clem@test.fr', telephone:'0633002277')
Contact.create!(email:'soph@test.fr', telephone:'0688991144')

seed_file = Rails.root.join('db', 'seeds', 'booking_seeds.yml')
bookings = YAML::load_file(seed_file)

bookings.each do |booking|
  bkg = Booking.new(
    start_time: DateTime.parse(booking['start_time']),
    contact: Contact.find(booking['contact']),
    nb_players: booking['adult_players'],
    game: Game.find(booking['game']))
  bkg.bags = booking['bags'].map do |bag|
    Bag.find(bag)
  end
  bkg.save
end

puts 'Seed terminé'