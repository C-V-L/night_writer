require './spec/spec_helper'

RSpec.describe 'EnglishTranslator' do
  let(:translator) { EnglishTranslator.new}

  describe '#initialize' do
    it 'exists' do
      expect(translator).to be_a(EnglishTranslator)
    end
  end
end