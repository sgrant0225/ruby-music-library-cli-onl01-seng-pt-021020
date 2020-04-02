require 'pry'

class Song 
  attr_accessor :name
   attr_reader :artist, :genre
   @@all = []
  
  def initialize(name, artist= nil, genre= nil)
    @name = name
    if artist 
      self.artist = artist 
      if genre 
        self.genre = genre
    end
    save
  end
end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save 
   @@all << self
  end
  
  def self.create(song) 
    create_song = self.new(song)
    create_song.save
    create_song
  end
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end
    
  def genre=(genre)
    @genre = genre 
    genre.add_song(self)
  end
    
  def self.find_by_name(name)
    @@all.detect do |song_name|
    song_name.name == name
    end
  end
  
 def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end 
  
  def self.new_from_filename
    
  end
  
end
  