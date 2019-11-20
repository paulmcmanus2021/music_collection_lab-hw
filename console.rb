require ('pry')
require_relative('models/artist.rb')
require_relative('models/album.rb')

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
  'genre' => 'Punk'
  })
  album1.save()

album2 = Album.new({
  'title' => 'Good Mourning',
  'genre' => 'Punk'
  })
  album2.save()

album3 = Album.new({
  'title' => 'Every Open Eye',
  'genre' => 'Electronic'
  })
  album3.save()

album4 = Album.new({
  'title' => 'Midnight Organ Fight',
  'genre' => 'Folk'
  })
  album4.save()
  
  binding.pry


  nil
