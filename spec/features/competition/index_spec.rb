require 'rails_helper' 

RSpec.describe 'Competition Index Page' do 
  before :each do 
    @comp1 = Competition.create!(name: 'World Cup', location: 'New York', sport: 'Baseball')
    @comp2 = Competition.create!(name: 'SuperBowl', location: 'Denver', sport: 'Football')
    @comp3 = Competition.create!(name: 'NBA Championship', location: 'Boston', sport: 'Basketball')
    @comp4 = Competition.create!(name: 'FIFA', location: 'Berlin', sport: 'Soccer')

    visit competitions_path
  end

  it 'is in on the right page' do 
    expect(current_path).to eq(competitions_path)
  end 
end 