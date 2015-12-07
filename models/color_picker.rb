class ColorPicker

  def self.color(letter)
    letter ||= 'C'
    return COLORS[letter.upcase] if COLORS[letter.upcase]
    return "#7E4796"
  end

  COLORS = {
    "A" => "#DC4139",
    "B" => "#dd85ba",
    "C" => "#468499",
    "D" => "#D9CD41",
    "E" => "#660066",
    "F" => "#1EB064",
    "G" => "#752A2A",
    "H" => "#B8DA91",
    "I" => "#ffa500",
    "J" => "#b0e0e6",
    "K" => "#f6546a",
    "L" => "#34426E",
    "M" => "#088da5",
    "N" => "#ccff00",
    "O" => "#66cdaa",
    "P" => "#ffc3a0",
    "Q" => "#fa8072",
    "R" => "#F868FF",
    "S" => "#daa520",
    "T" => "#A8E851",
    "U" => "#6dc066",
    "V" => "#3399ff",
    "W" => "#404040",
    "X" => "#8a2be2",
    "Y" => "#ffc0cb",
    "Z" => "#ffd700"
  }

end