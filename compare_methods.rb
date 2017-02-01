require_relative 'movie_rating_recomendations.rb'
class Compare_methods
    base = MovieData.new
    base.load_data('ml-100k/u1.base')
    base.return_user_database

    test_data = MovieData.new
    test_data.load_data('ml-100k/u1.test')

    correct = 0
    incorrect = 0
    total = 0
    test_data.return_user_database.each do |u, m|
        m.each do |movie|
            if base.predict_rating(u.to_s, movie[0]) == movie[1].to_i

                correct += 1
            else
                incorrect += 1

            end
            total += 1
            puts "total: #{total}"
        end
    end
    puts correct
    puts incorrect
    end
