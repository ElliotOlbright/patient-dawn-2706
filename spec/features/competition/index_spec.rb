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

  it 'can display all competitions' do 
    expect(page).to have_content(@comp1.name)
    expect(page).to have_content(@comp2.name)
    expect(page).to have_content(@comp3.name)
    expect(page).to have_content(@comp4.name)
  end 

  it 'can take user to competition show page' do 
    click_link "#{@comp1.name}"

    expect(current_path).to eq(competition_path(@comp1.id))
    expect(page).to have_content("#{@comp1.name} Show Page")
  end
end 