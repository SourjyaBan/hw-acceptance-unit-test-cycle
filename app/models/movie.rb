class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.same_director(movie_title)
    movie = Movie.where(title: movie_title)
    director = movie.select(:director).pluck(:director)
    if director[0] == nil or director[0] == ""
      return nil
    end
    Movie.where(director: director).pluck(:title)
  end
end
