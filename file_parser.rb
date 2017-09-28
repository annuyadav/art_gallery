module ArtGallery
  class FileParser
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def inputs
      return [] unless file_present?
      parse
    end

    private

    def file_present?
      return false unless name
      File.file?(name)
    end

    def parse
      inputs = []
      IO.foreach(name) do |line|
        line = line.strip
        unless line.empty?
          inputs << line.split(' ')
        end
      end
      inputs.reject(&:empty?)
    end
  end
end