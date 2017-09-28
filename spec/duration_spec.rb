require 'spec_helper'
require_relative '../lib/duration'
require_relative '../lib/room'
require_relative '../lib/visitor'

RSpec.describe ArtGallery::Base do

  let!(:visitor) { ArtGallery::Visitor.new(1) }
  let!(:room) { ArtGallery::Room.new(1) }
  let(:duration_options) { {visitor: visitor, room: room, action: 'I', enter_time: 540} }
  let(:duration_update_options) { {visitor: visitor, room: room, action: 'O', out_time: 560} }

  describe 'initialize' do
    it 'initiates Duration object' do
      _duration = ArtGallery::Duration.new(duration_options)
      expect(_duration.visitor).to eq visitor
      expect(_duration.room).to eq room
      expect(_duration.action).to eq duration_options[:action]
      expect(_duration.enter_time).to eq duration_options[:enter_time].to_i
    end

    it 'should initiate the Duration object with default values' do
      _duration = ArtGallery::Duration.new
      expect(_duration.visitor).to eq nil
      expect(_duration.room).to eq nil
      expect(_duration.action).to eq 'I'
      expect(_duration.enter_time).to eq 0
    end
  end

  describe 'self.exit_time' do
    it 'Update exit time of duration object' do
      ArtGallery::Duration.new(duration_options)
      ArtGallery::Duration.exit_time(duration_update_options)
      _duration = ArtGallery::Duration.all.find{ |d| d.room == room}
      expect(_duration.action).to eq 'O'
      expect(_duration.out_time).to eq duration_update_options[:out_time]
    end
  end
end