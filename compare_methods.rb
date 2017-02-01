require_relative 'movie_rating_recomendations.rb'
class Compare_methods
    base = MovieData.new
    base.load_data('ml-100k/u2.base')
    base.return_user_database

    test_data = MovieData.new
    test_data.load_data('ml-100k/u2.test')

    correct = 0
    incorrect = 0
    withinone = 0
    total = 0
    time1 = Time.new
    puts "Current Time : " + time1.inspect
    test_data.return_user_database.each do |user, movie|
        movie.each do |individual_movie|
          #loops through the test data seeing if the predicted rating is correct
            predicted_rating = base.predict_rating(user.to_s, individual_movie[0])
            if   predicted_rating == individual_movie[1].to_i
                correct += 1
            elsif  predicted_rating.between?(individual_movie[1].to_i, individual_movie[1].to_i + 1)
                withinone += 1
            else
              incorrect +=1
            end
            total += 1
            puts "total: #{total}" if total % 1000 == 0  #for testing purposes to see that the program is running becasue it is slow. Will get to the number of entries
        end
    end
    Time.now
    puts "correct: #{correct}"
    puts "incorrect: #{incorrect}"
    puts "Within one #{withinone}"
    time2 = Time.new
    puts "Current Time : " + time2.inspect
end
