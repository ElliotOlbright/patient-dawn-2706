# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@comp1 = Competition.create!(name: 'World Cup', location: 'New York', sport: 'Baseball')

@team1 = Team.create!(hometown: 'Denver', nickname: 'Rockies', competition_id: @comp1.id)
@team2 = Team.create!(hometown: 'San Francisco', nickname: 'Giants', competition_id: @comp1.id)

@player1 = Player.create!(name: 'Dom Juan', age: 20, team_id: @team1.id)
@player2 = Player.create!(name: 'Dom Juan', age: 30, team_id: @team1.id)
@player3 = Player.create!(name: 'Dom Juan', age: 40, team_id: @team1.id)

@player4 = Player.create!(name: 'Dom Juan', age: 30, team_id: @team2.id)
@player5 = Player.create!(name: 'Dom Juan', age: 40, team_id: @team2.id)
@player6 = Player.create!(name: 'Dom Juan', age: 50, team_id: @team2.id)