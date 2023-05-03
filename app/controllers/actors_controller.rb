class ActorsController < ApplicationController
  def index
    render({ :template => "actor_templates/index"})
  end

  def actor_details 
    @director_id =params.fetch("an_id")
    @director_entry = Actor.where({ :id => @director_id}).first
    @filmography = Character.where({ :actor_id => @director_entry.id})
    render({ :template => "actor_templates/show.html.erb"})
  end 
end
