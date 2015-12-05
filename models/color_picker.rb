class ColorPicker

  def self.color(letter)
    letter ||= 'C'
    COLORS[letter.upcase]
  end

  COLORS = {
    "A" => "#dc0e03",
    "B" => "#dd85ba",
    "C" => "#555000",
    "D" => "#555000",
    "E" => "#555000",
    "F" => "#1d7276",
    "G" => "#800000",
    "H" => "#555000",
    "I" => "#555000",
    "J" => "#555000",
    "K" => "#555000",
    "L" => "#555000",
    "M" => "#555000",
    "N" => "#555000",
    "O" => "#555000",
    "P" => "#555000",
    "Q" => "#555000",
    "R" => "#555000",
    "S" => "#555000",
    "T" => "#555000",
    "U" => "#555000",
    "V" => "#555000",
    "W" => "#555000",
    "X" => "#555000",
    "Y" => "#555000",
    "Z" => "#555000"
  }

end


# require 'uri'

# begin
#   uri = URI.parse('google.com/')
# rescue
#   puts 'URI not vaild'
# end

# # URI::InvalidURIError: bad URI(is not URI?): ://pocket.appappeal.com/

# uri.host.split('.').first


# require 'open-uri'
# open('http://www.skysu.net/').read =~ /<title>(.*?)<\/title>/
# p $1
