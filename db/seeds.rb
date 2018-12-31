# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
club = Club.create(name: 'Soul City Soccer Club')
season = Season.create(name: 'Winter 2018')
division = Division.create(name: 'Boys')
team = Team.create(name: 'Thundercunts', club_id: club.id)

user = User.create(
  first_name: 'Dan',
  last_name: 'Riley',
  email: 'hello@danriley.me',
  password: 'Carlee88',
  password_confirmation: 'Carlee88',
  club_role: 'staff',
  club_id: club.id
)

SeasonTeam.create(season_id: season.id, team_id: team.id, division_id: division.id)
TeamRoster.create(user_id: user.id, season_id: season.id, team_id: team.id)
