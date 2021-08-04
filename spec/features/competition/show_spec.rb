require 'rails_helper' 

RSpec.describe 'Competition Index Page' do 
  before :each do 
    @comp1 = Competition.create!(name: 'World Cup', location: 'New York', sport: 'Baseball')

    @team1 = Team.create!(hometown: 'Denver', nickname: 'Rockies', competition_id: @comp1.id)
    @team2 = Team.create!(hometown: 'San Francisco', nickname: 'Giants', competition_id: @comp1.id)

    visit competition_path(@comp1.id)
  end 

  it 'displays all attributes' do 
    expect(page).to have_content(@comp1.name)
    expect(page).to have_content(@comp1.location)
    expect(page).to have_content(@comp1.sport)
  end 

  it ' can display team names' do 
    expect(page).to have_content('Teams in this competition')
    expect(page).to have_content(@team1.hometown)
    expect(page).to have_content(@team1.nickname)
    expect(page).to have_content(@team2.hometown)
    expect(page).to have_content(@team2.nickname)
  end 
end 