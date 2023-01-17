require 'spec_helper'

RSpec.describe 'FileHandler' do
  # let(:handler) { FileHandler.new }

  describe '#read_file' do
    it 'can read a file' do
      allow(File).to receive(:open).and_return(File.open('./fixtures/hello_world_fixture.txt', 'r'))
      expect(FileHandler.read_file).to be_a(File)
    end
  end
end