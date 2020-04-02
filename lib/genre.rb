class Genre 
  extend Concerns::Findable
  
  attr_accessor :name, :songs, :artist
  
   @@all = []
  
  def initialize(name)
    @name = name
    @songs =[]
    save
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
     self.new(song)
  end
  def add_song(song)
   song.genre = self unless song.genre
  @songs << song unless @songs.include?(song)
  save
 end
 
 def artists
  many_artist = self.songs.collect do |song|
    song.artist
  end
  many_artist.uniq
 end
end  