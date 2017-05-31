require 'pry-byebug'
require_relative 'models/album'
require_relative 'models/artist'

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'Eddie Ng'})
artist2 = Artist.new({'name' => 'Josh Homme'})
artist3 = Artist.new({'name' => 'Ryan Adams'})

artist1.save()
artist2.save()
artist3.save()


album1 = Album.new({ 
  'title' => 'Blue-balled in Tontine',
  'genre' => 'Trip Hop', 
  'artist_id' => artist1.id
  })
album2 = Album.new({
  'title' => 'My Itchy Leg',
  'genre' => 'Desert Rock', 
  'artist_id' => artist2.id
  })
album3 = Album.new({
  'title' => 'Morose Ramblings',
  'genre' => 'Easy Listening', 
  'artist_id' => artist3.id
  })
album4 = Album.new({
  'title' => 'I Need A Drink',
  'genre' => 'Hard Rock', 
  'artist_id' => artist2.id
  })


album1.save()
album2.save()
album3.save()
album4.save()

artist1.albums()
artist2.albums()
artist3.albums()
album1.artists()
album2.artists()
album3.artists()
album4.artists()


binding.pry
nil
