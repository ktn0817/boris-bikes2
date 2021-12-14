require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases bike and checks its working' do
    bike = subject.release_bike 
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument}
end