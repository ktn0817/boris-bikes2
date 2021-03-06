require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it { is_expected.to respond_to(:dock).with(1).argument}

  it { is_expected.to respond_to :bike }

  it 'docks a bike' do
    bike = Bike.new

    expect(subject.dock(bike)).to eq bike
  end

  it 'shows docked bikes' do
    bike = Bike.new
    subject.dock(bike)

    expect(subject.bike).to eq bike
  end

  it 'raises an error when there are no bikes docked' do 
    expect { subject.release_bike }.to raise_error 'No bike docked'
  end

  it 'rasies an error when the station is at capacity' do
    bike = Bike.new
    subject.dock(bike)

    expect {subject.dock(Bike.new)}.to raise_error 'Station is full'
  end
end