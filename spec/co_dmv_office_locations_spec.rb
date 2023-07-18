require 'spec_helper'

RSpec.describe DmvOffice do
  before(:each) do
    @office = DmvOffice.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@office).to be_an_instance_of(DmvOffice)
    end
  end

  describe '#wa_ev_registrations' do
    it 'shows pulled data from wa_ev_registrations' do
      # require 'pry' ; binding.pry
      expect(@co_dmv_office_locations).to include()
      puts @co_dmv_office_locations
    end
  end
end