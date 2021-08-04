class TeamController < ApplicationController
  def new
  end 
  def create 
    #  require "pry"; binding.pry
      comp = Competition.find(params[:id])
      
      Team.create(
        nickname:(params[:nickname]),
        hometown:(params[:hometown]),
        competition_id: comp.id
     
      redirect_to competition_path(params(:competition_id))
    end 
end