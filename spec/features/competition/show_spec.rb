require 'rails_helper' 

RSpec.describe 'Competition Index Page' do 
  before :each do 
    @comp1 = Competition.create!(name: 'World Cup', location: 'New York', sport: 'Baseball')

    @team1 = Team.create!(hometown: 'Denver', nickname: 'Rockies', competition_id: @comp1.id)
    @team2 = Team.create!(hometown: 'San Francisco', nickname: 'Giants', competition_id: @comp1.id)

    @player1 = Player.create!(name: 'Dom Juan', age: 20, team_id: @team1.id)
    @player2 = Player.create!(name: 'Dom Juan', age: 30, team_id: @team1.id)
    @player3 = Player.create!(name: 'Dom Juan', age: 40, team_id: @team1.id)

    @player4 = Player.create!(name: 'Dom Juan', age: 30, team_id: @team2.id)
    @player5 = Player.create!(name: 'Dom Juan', age: 40, team_id: @team2.id)
    @player6 = Player.create!(name: 'Dom Juan', age: 50, team_id: @team2.id)
    

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

  it'can display average age of players' do 
    expect(page).to have_content("Average Age of Players: #{@team1.average_age_of_players}")
    expect(page).to have_content("Average Age of Players: #{@team2.average_age_of_players}")
  end

  it ' take a user toregeister a team' do
    click_link 'Register a team'

    expect(current_path).to eq(new_team_path)
  end
end 