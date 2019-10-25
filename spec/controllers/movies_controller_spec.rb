require 'rails_helper'
require 'spec_helper'

describe MoviesController do
    it 'should find movies with same director' do
        movies = ["Test1", "Test2", "Test3"]
        Movie.stub(:same_director).with("Test2").and_return(movies)
        get :director_movies, { :title => "Test2" }
        expect(assigns(:director_movie)).to eql(movies)
    end
end
    