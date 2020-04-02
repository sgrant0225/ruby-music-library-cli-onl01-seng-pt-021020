class Artist 
 extend Concerns::Findable
 
 attr_accessor :name, :songs
  
  @@all = []
  
 def initialize(name)
   @name = name
   @songs = []
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
   song.artist = self unless song.artist
  @songs << song unless @songs.include?(song)
  save
 end
 
 def genres 
   many_songs = self.songs.collect do |song| 
     song.genre
  end
  many_songs.uniq
 end
end  