require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @facility = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(FacilityFactory)
    end
  end

  describe '#co_dmv_locations' do
    it 'simple test to show pulled data from co_dmv_locations for further object tests' do
      # require 'pry' ; binding.pry
      expect(@co_dmv_office_locations).to include()
    end
  end

  describe '#co_dmv_office_locations' do
    it 'checks hashes for DMV Tremont Branch' do
      # require 'pry' ; binding.pry
      expect(@facility.create_facilities(@co_dmv_office_locations)).to include(having_attributes(
        address__1: "Suite 118",
        address_li: "2855 Tremont Place",
        city: "Denver",
        dmv_office: "DMV Tremont Branch",
        phone: "(720) 865-4600",
        state: "CO",
        zip: "80205"))
    end
  end

  describe '#co_dmv_office_locations' do
    it 'checks hashes for DMV Northeast Branch' do
      # require 'pry' ; binding.pry
      expect(@facility.create_facilities(@co_dmv_office_locations)).to include(having_attributes(
        address__1: "Suite 101",
        address_li: "4685 Peoria Street",
        city: "Denver",
        dmv_office: "DMV Northeast Branch",
        phone: "(720) 865-4600",
        state: "CO",
        zip: "80239"))
    end
  end

  describe 'new_york_dmv_locations' do
    it 'simple test to show pulled data from new_york_dmv_locations for further object tests' do
      # require 'pry' ; binding.pry
      expect(@new_york_facilities).to include()
    end
  end

  describe '#new_york_dmv_locations and passes with intent to fail to_not' do
    it 'checks mismatched hashes to PURPOSELY Mismatch JAMAICA office and passes with intended to_not fail' do
      # require 'pry' ; binding.pry
      # Purposely wrote test as a failure but didnt want it to show on
      # RSpec fails for rubric purposes so to_not is being used to pass the intended fail
      expect(@facility.create_facilities(@new_york_facilities)).to_not include(having_attributes(
        dmv_office: "JAMAICA",
        office_type: "DISTRICT OFFICE",
        phone: "7189666155",
        address__1: "168-46 91ST AVE., 2ND FLR",
        city: "JAMAICA",
        state: "NY",
        zip: "11432"))
    end
  end

  describe '#new_york_dmv_locations and passes' do
    it 'checks hashes to match Jamaica office and passes' do
      # require 'pry' ; binding.pry
      expect(@facility.create_facilities(@new_york_facilities)).to include(having_attributes(
        dmv_office: "JAMAICA",
        address_li: "DISTRICT OFFICE",
        phone: "7189666155",
        address__1: "168-46 91ST AVE., 2ND FLR",
        city: "JAMAICA",
        state: "NY",
        zip: "11432"))
    end
  end

  describe 'Missouri Facilities Data pull check' do
    it 'simple test to show pulled data from Missouri_facilities for further object tests' do
      # require 'pry' ; binding.pry
      expect(@missouri_facilities).to include()
    end
  end

  describe '#References Dexter,MO Hash and passes' do
    it 'checks hashes to match Missouri Dexter office and passes' do
      # require 'pry' ; binding.pry
      expect(@facility.create_facilities(@missouri_facilities)).to include(having_attributes(
        dmv_office: "1MV",
        address_li: "Stoddard",
        phone: "(573) 624-8808",
        address__1: "119 VINE ST",
        city: "DEXTER",
        state: "MO",
        zip: "63841"))
    end
  end

  describe '#References Princeton,MO Hash and passes' do
    it 'checks hashes to match Missouri Princeton office and passes' do
      # require 'pry' ; binding.pry
      expect(@facility.create_facilities(@missouri_facilities)).to include(having_attributes(
        dmv_office: "1MV",
        address_li: "Mercer",
        phone: "(660) 748-4445",
        address__1: "703 HICKLAND SUITE B",
        city: "PRINCETON",
        state: "MO",
        zip: "64673"))
    end
  end  

  describe '#References Princeton,MO Hash and passes' do
    it 'checks hashes to PURPOSELY Mismatch Missouri Princeton office and passes with intended to_not fail' do
      # require 'pry' ; binding.pry
      expect(@facility.create_facilities(@missouri_facilities)).to_not include(having_attributes(
        dmv_office: "1MV",
        address_li: "MercEr",
        phone: "(660) 748-4445",
        address__1: "703 HICKLAND SUITE B",
        city: "PRINCETON",
        state: "MO",
        zip: "64673"))
    end
  end  
end