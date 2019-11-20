require ('pry')
require_relative('models/artist.rb')
require_relative('models/album.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Alkaline Trio'
  })
  artist1.save()

artist2 = Artist.new({
  'name' => 'Chvrches'
  })
  artist2.save

artist3 = Artist.new({
  'name' => 'Frightened Rabbit'
  })
  artist3.save

album1 = Album.new({
  'title' => 'Maybe I\'ll Catch Fire',
  'genre' => 'Punk',
  'artist_id' => artist1.id
  })
  album1.save()

album2 = Album.new({
  'title' => 'Good Mourning',
  'genre' => 'Punk',
  'artist_id' => artist1.id
  })
  album2.save()

album3 = Album.new({
  'title' => 'Every Open Eye',
  'genre' => 'Electronic',
  'artist_id' => artist2.id
  })
  album3.save()

album4 = Album.new({
  'title' => 'Midnight Organ Fight',
  'genre' => 'Folk',
  'artist_id' => artist3.id
  })
  album4.save()

  binding.pry


  nil
