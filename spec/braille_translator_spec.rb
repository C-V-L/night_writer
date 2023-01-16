require './lib/braille_translator'

RSpec.describe 'BrailleTranslator' do

  let(:translator) { BrailleTranslator.new}
  describe '#initialize' do
    it 'exists' do
      expect(translator).to be_a(BrailleTranslator)
    end
  end
end