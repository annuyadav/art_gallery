require_relative 'base'

module ArtGallery
  class Duration < Base
    attr_accessor :visitor, :room, :enter_time, :action, :out_time

    def initialize(visitor: nil,room: nil,action: 'I',enter_time: nil)
      @visitor = visitor
      @room = room
      @enter_time = enter_time.to_i
      @action = action
    end

    def self.exit_time(visitor: nil,room: nil,action: 'O',out_time: nil)
      _duration = ArtGallery::Duration.all.find{ |duration| duration.visitor == visitor && duration.room == room}
      _duration.out_time = out_time.to_i
      _duration.action = action
    end
  end
end
