class DirectorsController < ApplicationController
  def index
    render({ :template => "dir_templates/index"})
  end

  def wisest
    @oldest_director = Director.where.not({:dob => nil}).order({:dob => :asc}).at(0)
    render({ :template => "dir_templates/eldest"})
  end

  def youngest 
    @youngest_director = Director.where.not({:dob => nil}).order({:dob => :desc}).at(0)
    render({ :template => "dir_templates/youngest"})
  end 
  def director_details 
    @director_id =params.fetch("an_id")
    @director_entry = Director.where({ :id => @director_id}).first
    @filmography = Movie.where({ :director_id => @director_entry.id})

  
    render({ :template => "dir_templates/show.html.erb"})
  end 
end
