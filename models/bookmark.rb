require_relative "db_base"

class Bookmark < DBBase

  attributes( { :url => :string, :title => :string, :genre => :string } )

end