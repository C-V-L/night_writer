require './spec/spec_helper'

RSpec.describe 'Translator' do
  let(:translator) { Translator.new}

  describe '#initialize' do
    it 'exists' do
      expect(translator).to be_a(Translator)
    end
  end

  describe 'braille keys' do
    describe 'key1' do
      it 'returns a string of braille' do
        expect(translator.key1).to eq('00')
      end
    end

    describe 'key2' do
      it 'returns a string of braille' do
        expect(translator.key2).to eq('0.')
      end
    end

    describe 'key3' do
      it 'returns a string of braille' do
        expect(translator.key3).to eq('.0')
      end
    end

    describe 'key4' do
      it 'returns a string of braille' do
        expect(translator.key4).to eq('..')
      end
    end
  end
  
  describe '#eng_to_braille_library' do
    it 'can return an array of braille that corresponds to a letter' do
      expect(translator.eng_to_braille['a']).to eq(['0.', '..', '..'])
      expect(translator.eng_to_braille['z']).to eq(["0.", ".0", "00"])
    end
  end
  
  context 'english to braille translation' do

    describe '#convert_to_braille' do
      it 'can convert a string an array of braille values' do
        message = 'hello'
        expected = ["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]
        expect(translator.convert_to_braille(message)).to eq(expected)
      end
    end

    describe '#formatted_braille_conversion' do
      it 'can take a string of english and convert to braille' do
        message = 'hello'
        expected = "0.0.0.0.0.\n00.00.0..0\n....0.0.0."
        expect(translator.formatted_braille_conversion(message)).to eq(expected)
      end
    end
  end
  
  context 'braille to english' do
    describe '#convert_to_english' do
      it 'can convert a string of braille to english' do
        message = "0.0.0.0.0.\n00.00.0..0\n....0.0.0."
        expected = 'hello'
        expect(translator.convert_to_english(message)).to eq(expected)
      end
    end

    describe '#convert_to_english helper methods' do

      describe '#parse_array' do
        it 'can seperate arrays by every two characters' do
          array_argument = ["AAAAAA", "BBBBBB","CCCCCC"]
          expected_parsed_array = [[["A", "A"], ["A", "A"], ["A", "A"]], 
                                  [["B", "B"], ["B", "B"], ["B", "B"]], 
                                  [["C", "C"], ["C", "C"], ["C", "C"]]]

          expect(translator.parse_array(array_argument)).to eq(expected_parsed_array)
        end
      end

      describe '#transpose_parsed_array' do
        it 'takes a parsed array and transposed it to readable braille' do
          parsed_array = [[["A", "A"], ["A", "A"], ["A", "A"]], 
                          [["B", "B"], ["B", "B"], ["B", "B"]], 
                          [["C", "C"], ["C", "C"], ["C", "C"]]]
          expected_transposed_array = [[["A", "A"], ["B", "B"], ["C", "C"]], 
                                      [["A", "A"], ["B", "B"], ["C", "C"]], 
                                      [["A", "A"], ["B", "B"], ["C", "C"]]]
          expect(translator.transpose_parsed_array(parsed_array)).to eq(expected_transposed_array)
        end
      end

      describe '#join_transposed_array' do
        it 'it can join a transposed array of braille into readable braille' do
          transposed_array = [[["A", "A"], ["B", "B"], ["C", "C"]], 
                              [["A", "A"], ["B", "B"], ["C", "C"]], 
                              [["A", "A"], ["B", "B"], ["C", "C"]]]
          expected_joined_array = [["AA", "BB", "CC"], ["AA", "BB", "CC"], ["AA", "BB", "CC"]]

          expect(translator.join_transposed_array(transposed_array)).to eq(expected_joined_array)
        end
      end

      describe '#braille_to_english' do
        it 'can read braille and produce an english string' do
          braille_string = ("0.0.0.0.0.\n00.00.0..0\n....0.0.0.")
          expected = "hello"
          expect(translator.convert_to_english(braille_string)).to eq(expected)
        end
      end
    end
  end
end