require 'rails_helper'

describe Movie do
    describe 'all_ratings' do
        it 'should return correct ratings' do
            ratings = Movie.all_ratings
            expected_ratings = ['G', 'PG', 'PG-13', 'NC-17', 'R']
            expect(ratings).to eq(expected_ratings)
        end
    end
    describe 'same_director' do
        it 'should return movies with same director, and return nil if director does not exist' do
            Movie.create(:title => 'Movie1', :director => 'Director1')
            Movie.create(:title => 'Movie2', :director => 'Director1')
            Movie.create(:title => 'Movie3')
            expect(Movie.same_director('Movie1')).to eql(['Movie1', 'Movie2'])
            expect(Movie.same_director('Movie3')).to eq(nil)
        end
    end
end