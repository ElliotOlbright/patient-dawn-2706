class Team < ApplicationRecord
  has_many :players

  def average_age_of_players
    players.average(:age).to_i
  end
end
