class MoviesController < ApplicationController
  def index
    render({ :template => "movie_templates/index"})
  end

  def movie_details 
    @director_id =params.fetch("an_id")
    @director_entry = Movie.where({ :id => @director_id}).first
    render({ :template => "movie_templates/show.html.erb"})
  end 
end
