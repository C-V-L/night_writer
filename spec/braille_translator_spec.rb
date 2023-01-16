require './spec/spec_helper'

RSpec.describe 'BrailleTranslator' do
  let(:translator) { BrailleTranslator.new}

  describe '#initialize' do
    it 'exists' do
      expect(translator).to be_a(BrailleTranslator)
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