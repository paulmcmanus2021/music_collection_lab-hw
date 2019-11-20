require ('pry')
require_relative('models/artist.rb')
require_relative('models/album.rb')

artist1 = Artist.new({

  'name' => "Alkaline Trio"
  })
  artist1.save()
