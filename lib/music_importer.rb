require 'pry'

class MusicImporter

attr_accessor :path, :files

def initialize(path)
  @path = path
 end
 
 def files
  Dir
 end
end