require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_services('New Drivers License')
      @facility_1.add_services('Renew Drivers License')
      @facility_1.add_services('Vehicle Registration')
      # require 'pry' ; binding.pry
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#shows registration date' do # registration method now built and failing
    # now fixed 2:32PM
    it '#shows registration date' do
      expect(@cruz.registration_date).to eq(nil)
    end
  end

  describe '#shows registered vehicles empty' do 
    it '#shows registered vehicles empty' do
      expect(@facility_1.registered_vehicles).to eq([])
    end
  end

  describe '#shows collected fees' do 
    it '#shows collected fees' do
      expect(@facility_1.collected_fees).to eq(0)
    end
  end

  describe '#registers vehicle(cruz)' do # pass...facility_1 MUST be in test expect since its orignally passed into that facility to begin with for "Vehicle Registration"
    it '#registers vehicle(cruz)' do
      @facility_1.add_services('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.register_vehicle(@cruz)).to include(@cruz)
      expect(@cruz.registration_date).to eq(Date.today)
      expect(@facility_1.plate_type(@cruz)).to eq(:regular)
    end
  end

  describe "#show registered vehicles" do
    it "#shows regitered vehicles" do
      @facility_1.add_services('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      # require 'pry' ; binding.pry
      expect(@facility_1.registered_vehicles). to include(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
    end
  end

  describe "#register camaro, show reg date and plate type" do # test passes
    it "#register camaro, show reg date and plate type" do
      @facility_1.add_services('Vehicle Registration')
      @facility_1.register_vehicle(@camaro)
      require 'pry' ; binding.pry
      expect(@facility_1.register_vehicle(@camaro)).to include(@camaro)
      expect(@camaro.registration_date).to eq(Date.today)
      expect(@facility_1.plate_type(@camaro)).to eq(:antique)
    end
  end
end