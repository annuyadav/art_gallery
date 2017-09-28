require_relative '../lib/duration'
require_relative '../lib/room'
require_relative '../lib/visitor'


module ArtGallery
  class FootTrafficReport

    attr_accessor :inputs, :number_of_input

    def initialize(inputs: [], number_of_input: nil)
      @inputs = inputs
      @number_of_input = number_of_input.to_i
    end

    def analyze_foot_traffic
      inputs.each do |inp|
        visitor = ArtGallery::Visitor.find_or_create_by_id(inp[0])
        room = ArtGallery::Room.find_or_create_by_id(inp[1])
        case inp[2]
          when 'I'
            ArtGallery::Duration.new(visitor: visitor,room: room,action: inp[2],enter_time: inp[3])
          when 'O'
            ArtGallery::Duration.exit_time(visitor: visitor,room: room,action: inp[2],out_time: inp[3])
          else
            puts 'The data provided is not correct'
        end
      end
    end

    def put_results
      ArtGallery::Room.all.sort_by{ |room| room.id.to_i}.each do |room|
        durations = ArtGallery::Duration.all.find_all{ |d| d.room == room}
        total_time = 0
        durations.each do |d|
          time = d.out_time.to_i - d.enter_time.to_i
          total_time = total_time + time
        end
        avg_time = total_time/(durations.count.zero? ? 1 : durations.count)
        p "Room #{room.id}, #{avg_time} minutes average visit. #{durations.count} visitor#{durations.count > 1 ? 's' : nil} total."
      end
    end
  end
end