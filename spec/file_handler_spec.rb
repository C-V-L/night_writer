require 'spec_helper'

RSpec.describe 'FileHandler' do

  describe '#read_file' do
    it 'can read a file' do
      allow(File).to receive(:open).and_return(File.open('./fixtures/hello_world_fixture.txt', "r"))
      expect(FileHandler.read_file).to be_a(File)
    end
  end

  describe '#write_file' do
    it 'can write a file' do
      allow(File).to receive(:new).and_return(File.open('./fixtures/hello_world_fixture.txt', "r"))
      expect(FileHandler.write_file).to be_a(File)
    end
  end

  describe '#count_incoming_characters' do
    it 'can count the characters of the incoming file' do
      allow(FileHandler).to receive(:read_file).and_return(File.open('./fixtures/hello_world_fixture.txt', "r"))
      expect(FileHandler.count_english_characters).to eq(11)
    end
  end

  describe '#count_outgoing_characters' do
    it 'can count the characters of the outgoing file' do
      allow(FileHandler).to receive(:read_file).and_return(File.open('./fixtures/hello_world_braille_fixture.txt', "r"))
      expect(FileHandler.count_braille_characters).to eq(11)
    end
  end
end