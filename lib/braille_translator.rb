class BrailleTranslator
  attr_reader :eng_to_braille
  def initialize
    @eng_to_braille = eng_to_braille_library 
  end

  def key1
    '00'
  end

  def key2
    '0.'
  end

  def key3
    '.0'
  end

  def key4
    '..'
  end 

  def eng_to_braille_library
    { 
    'a' => [key2, key4, key4], 
    'b' => [key2, key2, key4], 
    'c' => [key1, key4, key4], 
    'd' => [key1, key3, key4], 
    'e' => [key2, key3, key4], 
    'f' => [key1, key2, key4], 
    'g' => [key1, key1, key4], 
    'h' => [key2, key1, key4], 
    'i' => [key3, key2, key4], 
    'j' => [key3, key1, key4], 
    'k' => [key2, key4, key2], 
    'l' => [key2, key2, key2],
    'm' => [key1, key4, key2], 
    'n' => [key1, key3, key2],
    'o' => [key2, key3, key2], 
    'p' => [key1, key2, key2], 
    'q' => [key1, key1, key2], 
    'r' => [key2, key1, key2], 
    's' => [key3, key2, key2], 
    't' => [key3, key1, key2], 
    'u' => [key2, key4, key1], 
    'v' => [key2, key2, key1], 
    'w' => [key3, key1, key3], 
    'x' => [key1, key4, key1], 
    'y' => [key1, key3, key1], 
    'z' => [key2, key3, key1],
    ' ' => [key4, key4, key4]
    }
  end

  def formatted_braille_conversion(text)
    braille_characters = convert_to_braille(text)

    joined_text = braille_characters.transpose.map do |braille|
      braille.join.chars.each_slice(80).map do |slice|
        slice.join
      end
    end.transpose.join("\n")
    
    joined_text
  end

  def convert_to_braille(text)
    text.chars.map do |char|
      eng_to_braille[char]
    end
  end
end