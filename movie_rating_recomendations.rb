# Aaron Gold
# Movie Part 1
# Capstone - Professor Salas

require 'byebug'
class MovieData
    def load_data
        @user_database = {} # user database with user as the key and values. hash
        @movie_rating_databse = {}
        File.open('u.data').each do |eachLine|
            eachLine = eachLine.split(' ')
            add_user_hash(eachLine[0].to_i, eachLine[1].to_i, eachLine[2].to_i) # creates the user database hash
            move_to_rating(eachLine[1].to_i, eachLine[2].to_i)
        end
    end

    def add_user_hash(user_id, movie_id, rating)
        # function to add user to hash. If it already is there then push it to the array. Otherwise create new array under said key
        if !@user_database[user_id.to_s].nil?
            @user_database[user_id.to_s][movie_id.to_s] = rating.to_s
        else
            @user_database[user_id.to_s] = {} # []
            @user_database[user_id.to_s][movie_id.to_s] = rating.to_s
        end
      end

    def move_to_rating(movie_id, rating)
        if !@movie_rating_databse[movie_id.to_s].nil?
            @movie_rating_databse[movie_id.to_s].push(rating)
        else
            @movie_rating_databse[movie_id.to_s] = []
            @movie_rating_databse[movie_id.to_s].push(rating)
        end
      end

    def similarity(user1, user2)
        similarity_rate = 0
        user1_ratings = @user_database[user1] # gives all movies and rating for user
        user2_ratings = @user_database[user2]

        return false if user1_ratings == user2_ratings
        return false if @user_database[user1].nil? || @user_database[user2].nil?
        user1_ratings.to_a.each do |x, y|
            movie = x.to_i
            rating = y.to_i
            if !user2_ratings[x].nil? && user2_ratings[x].to_i.between?(rating - 1, rating + 1)
                similarity_rate += 1
            end
        end
        # puts similarity_as_percentage(similarity_rate, user1_ratings, user2_ratings)
        if similarity_as_percentage(similarity_rate, user1_ratings, user2_ratings) > 49
            return true
            esle
            return false
        end
    end

    def similarity_as_percentage(similarity_rate, user1_ratings, user2_ratings)
        # figures the similarity as a percentage of total movies watched. Based off of the smallest one

        number_of_user1_reviews = user1_ratings.length
        number_of_user2_reviews = user2_ratings.length

        smaller_number_of_movies = 0
        if number_of_user1_reviews < number_of_user2_reviews
            smaller_number_of_movies = number_of_user1_reviews
        else
            smaller_number_of_movies = number_of_user2_reviews
        end
        (similarity_rate * 100) / smaller_number_of_movies # returns the similiarty as a percentage. The similarity is based off of same movies with a review wihtin one devided by whoever has the least amount of movies reviewed
    end

    def similar_users_method(user1)
        counter = 1
        similar_users = []
        while counter <= @user_database.length
            similar_users.push(counter) if similarity(user1, counter.to_s)
            counter += 1
        end
        similar_users
    end

    def average_score(movie_id)
        movie_data_reviews = []
        movie_data_reviews = @movie_rating_databse[movie_id.to_s]
        total_review_score = 0

        movie_data_reviews.each do |review|
            review_int = review.to_int
            total_review_score += review_int
        end
        average = total_review_score / movie_data_reviews.length
end

    def predict_rating(user_id, movie_id)
        similar_users_array =  similar_users_method(user_id)
        # runs through similar users seeing if they ranked the passed in movie
        number_of_reviews = 0
        total_review_score = 0
        similar_users_array.each do |x|
            user = x.to_s
            individual_user = @user_database[user]
            unless individual_user[movie_id].nil?
                number_of_reviews += 1
                total_review_score += individual_user[movie_id].to_i
            end
        end
        if number_of_reviews > 5
            # only base the alogrithmic determined movie rating if 5 or more similar users rated it. Otherwise it could be a fluke and instead should return the avergae of that movie
            return total_review_score / number_of_reviews
        else
            return average_score(movie_id)
        end
        end
end

movie = MovieData.new
movie.load_data
print movie.similarity('213', '212')
movie.similar_users_method('63')
movie.average_score(641)
puts movie.predict_rating('153', '754')
