require './lib/braille_translator'

RSpec.describe 'BrailleTranslator' do
  let(:translator) { BrailleTranslator.new}

  describe '#initialize' do
    it 'exists' do
      expect(translator).to be_a(BrailleTranslator)
    end

    xit 'has a library of english to braille' do
      expect(translator.eng_to_braille).to eq({})
    end
  end

  describe 'braille keys' do
    describe 'key1' do
      it 'returns a string of braille' do
        expect(translator.key1).to eq('00')
      end
    end
  end
end