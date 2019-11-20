require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/album.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class AlbumTest < MiniTest::Test

  def test_can_create_new_album
    album_details = {
      'title' => 'Maybe I\'ll Catch Fire',
      'genre' => 'Punk'
    }

    new_album = Album.new(album_details)
    assert_equal('Punk', new_album.genre)
  end

end
