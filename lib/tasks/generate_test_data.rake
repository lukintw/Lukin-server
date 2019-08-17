namespace :generate_test_data do
  task player_place_data: :environment do
    (0...5000).each do |i|
      puts i
      player = Player.create(name: (0...8).map { (65 + rand(26)).chr }.join, birth: '1900-01-01')
      Datum.create(player_id: player.id, current_hp: 999999, latitude: rand(20.0..25.0), longitude:rand(120.0..122.0))
    end
  end
  task delete_test_data: :environment do
    Player.where(birth: '1900-01-01').destroy_all
    Datum.where(current_hp: 999999).destroy_all
  end
end
