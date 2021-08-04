class AddCompetitionToTeam < ActiveRecord::Migration[5.2]
  def change
    add_reference :teams, :competition, foreign_key: true
  end
end
