require 'spec_helper'
require_relative '../lib/base'
require 'byebug'

RSpec.describe ArtGallery::Base do

  let!(:base1) { ArtGallery::Base.new(1) }
  let!(:base2) { ArtGallery::Base.new(2) }

  describe 'initialize' do
    it 'initiates base object' do
      _base = ArtGallery::Base.new(3)
      expect(_base.id).to eq 3
    end

    it 'should raise ArgumentError when id not passed' do
      expect{ ArtGallery::Base.new }.to raise_error(ArgumentError)
    end
  end

  describe 'all' do
    it 'return all objects' do
      _base = ArtGallery::Base.all
      expect(_base.count).to eq ArtGallery::Base.all.count
    end
  end

  describe 'find or create by id' do
    it 'return existing object with' do
      _base = ArtGallery::Base.find_or_create_by_id(1)
      expect(_base).to eq base1
    end

    it 'create new object and return it' do
      _base = ArtGallery::Base.find_or_create_by_id(5)
      expect(_base.id).to eq 5
    end
  end
end