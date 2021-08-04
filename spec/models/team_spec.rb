require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it { should have_many(:players) }
  end
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
  end 

  describe 'methods' do 
    describe '#average_age_of_players' do 
      it 'can average the age of all player on a team' do
        expect(@team1.average_age_of_players).to eq(30)
        expect(@team2.average_age_of_players).to eq(40)
      end
    end
  end 
end
