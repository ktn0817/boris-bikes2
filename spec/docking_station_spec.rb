require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases bike and checks its working' do
    bike = subject.release_bike 
    expect(bike).to be_working
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
    expect { subject.bike }.to raise_error 
  end
end