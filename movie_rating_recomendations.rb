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
            # add_user_hash(eachLine[0], eachLine[1], eachLine[2]) # creates the user database hash
            move_to_rating(eachLine[1], eachLine[2])
        end
    end

    def add_user_hash(user_id, movie_id, rating)
        # function to add user to hash. If it already is there then push it to the array. Otherwise create new array under said key
        if !@user_database[user_id.to_s].nil?
            @user_database[user_id.to_s].push([movie_id, rating])
        else
            @user_database[user_id.to_s] = []
            @user_database[user_id.to_s].push([movie_id, rating])
        end
      end

        def move_to_rating(movie_id, rating)
            # function to add user to hash. If it already is there then push it to the array. Otherwise create new array under said key
            if !@movie_rating_databse[movie_id.to_s].nil?
                @movie_rating_databse[movie_id.to_s].push([rating])
            else
                @movie_rating_databse[movie_id.to_s] = []
                @movie_rating_databse[movie_id.to_s].push([rating])
            end
          end

# puts @user_database
    #     def most_similar(user1)
    #       #This function takes a user and then in the for loops goes index by index of the user_database and sees whats similar_users
    #       #the user is similar if they have revieved the same movie and their rating is wihtin one (determiend in the if statement)
    #       #Unforutantetly, I am recieving "movie_data.rb:95:in `block (2 levels) in most_similar': undefined method `[]' for nil:NilClass (NoMethodError)
    #         user1_data = []
    #         similar_users = []
    #         user1_data = @user_database[user1.to_s]
    #         puts user1_data
    #
    #         # for i in 0..user1_data.length - 1 do
    #         #     for x in 0..@user_database.length - 1 do
    #         #         if (user1_data[i][0] == @user_database[x][0]) && !user1_data[i].nil? && !user1_data[x].nil? && ((user1_data[i][1].to_i - @user_database[x][1].to_i <= 1) || (@user_database[x][1].to_i - user1_data[i][1].to_i <= 1))
    #         #             similar_users.push[i]
    #         #         end
    #         #     end
    #         #
    #         #   end
    #           #following the above I would rerun the similar_users through the similarity method to deterine if two users are similar_users
    #           #if the simuarity score is >70% I would declare them similr and add them to a final array to return.
    #     end
    # end


    def average_score(movie_id)
      #This function takes a user and then in the for loops goes index by index of the user_database and sees whats similar_users
      #the user is similar if they have revieved the same movie and their rating is wihtin one (determiend in the if statement)
      #Unforutantetly, I am recieving "movie_data.rb:95:in `block (2 levels) in most_similar': undefined method `[]' for nil:NilClass (NoMethodError)
      movie_data_reviews = []

        movie_data_reviews = @movie_rating_databse[movie_id.to_s]
        puts movie_data_reviews
        counter = 0
        total_review_number = 0

        movie_data_reviews.length.times do |i|
          counter +=1
          singular_review =  movie_data_reviews[i]
          total_review_number+= singular_review.to_i
          #total_review_number+=
          puts "singular is #{singular_review}"
        end
        puts "counts is #{counter}"
        puts "total review total is #{total_review_number}"
        #     for x in 0..@user_database.length - 1 do
        #         if (user1_data[i][0] == @user_database[x][0]) && !user1_data[i].nil? && !user1_data[x].nil? && ((user1_data[i][1].to_i - @user_database[x][1].to_i <= 1) || (@user_database[x][1].to_i - user1_data[i][1].to_i <= 1))
        #             similar_users.push[i]
        #         end
        #     end
        #
        #   end
          #following the above I would rerun the similar_users through the similarity method to deterine if two users are similar_users
          #if the simuarity score is >70% I would declare them similr and add them to a final array to return.
    # end
end


# puts @movie_rating_databse[242]
end


movie = MovieData.new
movie.load_data

# puts movie.popularity_list

movie.average_score(242)
