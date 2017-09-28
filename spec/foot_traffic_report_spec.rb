require 'spec_helper'
require_relative '../lib/duration'
require_relative '../lib/foot_traffic_report'
require 'byebug'


RSpec.describe ArtGallery::FootTrafficReport do

  let(:input_values) { [[0,0,'I',540], [1,0,'I',540], [0,0,'O',560], [1,0,'O',560]] }

  describe 'initialize' do
    it 'initiates foot traffic report object' do
      _report = ArtGallery::FootTrafficReport.new(inputs: input_values, number_of_input: 4)
      expect(_report.inputs).to eq input_values
      expect(_report.number_of_input).to eq 4
    end

    it 'should initiate blank foot traffic report object' do
      _report = ArtGallery::FootTrafficReport.new
      expect(_report.inputs).to eq []
      expect(_report.number_of_input).to eq 0
    end
  end

  describe 'analyze_foot_traffic' do
    context 'when correct data is provided' do
      let(:report) { ArtGallery::FootTrafficReport.new(inputs: input_values, number_of_input: 4) }
      it 'create duration objects' do
        expect { report.analyze_foot_traffic }.to change { ArtGallery::Duration.all.count }.by(2)
      end
    end
  end
end