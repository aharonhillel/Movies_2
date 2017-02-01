require_relative 'movie_rating_recomendations.rb'
class Compare_methods
    base = MovieData.new
    base.load_data('ml-100k/u3.base')
    base.return_user_database

    test_data = MovieData.new
    test_data.load_data('ml-100k/u3.test')

    correct = 0
    incorrect = 0
    total = 0
    test_data.return_user_database.each do |u, m|
        m.each do |movie|
          #loops through the test data seeing if the predicted rating is correct
            if base.predict_rating(u.to_s, movie[0]) == movie[1].to_i
                correct += 1
            else
                incorrect += 1
            end
            total += 1
            puts "total: #{total}" if total % 1000 == 0  #for testing purposes to see that the program is running becasue it is slow. Will get to the number of entries
        end
    end
    puts "correct: #{correct}"
    puts "incorrect: #{incorrect}"
end
