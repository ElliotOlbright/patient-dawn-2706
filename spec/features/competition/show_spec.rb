require 'rails_helper' 

RSpec.describe 'Competition Index Page' do 
  before :each do 
    @comp1 = Competition.create!(name: 'World Cup', location: 'New York', sport: 'Baseball')

    visit competition_path(@comp1.id)
  end 

  it 'displays all attributes' do 
    expect(page).to have_content(@comp1.name)
    expect(page).to have_content(@comp1.location)
    expect(page).to have_content(@comp1.sport)
  end 
end 