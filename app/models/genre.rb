require 'pry'
class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.count
  end

  def artist_count
    artists = []
    self.songs.each do |song|
      artists << song.artist
    end
    artists.length
  end

  def all_artist_names
    artists = []
    self.songs.collect do |song|
      song.artist.name
    end
  end
end
