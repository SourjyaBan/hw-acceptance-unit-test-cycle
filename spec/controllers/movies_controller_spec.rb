require 'rails_helper'
require 'spec_helper'

describe MoviesController do
    describe 'director_movies' do
        it 'should find movies with same director' do
            movies = ["Test1", "Test2", "Test3"]
            Movie.stub(:same_director).with("Test2").and_return(movies)
            get :director_movies, { :title => "Test2" }
            expect(assigns(:director_movie)).to eql(movies)
        end
        it 'should redirect to homepage if no director found and flash a message' do
            Movie.stub(:same_director).with("Test1").and_return(nil)
            get :director_movies, { :title => "Test1" }
            expect(flash[:notice]).to eql("'Test1' has no director info")
            expect(response).to redirect_to(movies_path)
        end
    end
    describe 'show' do
        it 'should find movie by id' do
            movies = 'Movie'
            Movie.stub(:find).with('Test_ID').and_return(movies)
            get :show, { :id => 'Test_ID' }
            expect(assigns(:movie)).to eql(movies)
        end
    end
    describe 'index' do
        it 'should set title header correctly' do
            get :index, { :sort => 'title'}
            expect(assigns(:title_header)).to eq('hilite')
        end
        it 'should set date header correctly' do
            get :index, { :sort => 'release_date'}
            expect(assigns(:date_header)).to eq('hilite')
        end
    end
end