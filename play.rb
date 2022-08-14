class Hangman
    def initialize      
        # convert to an array
        # once you make a guess, we want to remove that letter from the available letters to guess from
        # instance variable allows you to use it within different methods within the class
        @word = words.sample
        @lives = 7
        @word_teaser = ""
        # run this block of code (do) number of times equal to the length of the first word
        @word.first.size.times do
            @word_teaser += "_ "
        end
    end
    
    def words
        [
               ['cricket', 'a game play by gentlemen'],
               ['jogging', 'we are not walking...'],
               ['celebrate', 'a game play by gentlemen'],
               ['continent', 'there are 7 of these'],
               ['exotic', 'not from around here...'],
            
        ]
    end

    # nil default value for last_guess
    def print_teaser last_guess = nil
        
        # we only want to call this method if the last_guess is not nil
        update_teaser(last_guess) unless last_guess.nil?

        puts @word_teaser
    end

    def update_teaser last_guess
        # each item in the array will be underscores once the script is ran for the first time
        new_teaser = @word_teaser.split
        
        new_teaser.each_with_index do |letter, index|
            
            #replace blank values with letter if it matches with letter in word being guessed

            # checking to see if letter array is _ and if the word (that is split into an array) letter at that index is equal to the last guess
            if letter == '_' && @word.first[index] === last_guess
                
                #if there is a match, update the underscore value with the letter if it matched at the right position
                new_teaser[index] = last_guess
            end
        end

        # overrite word_teaser value with the new updated string with the found letters
        @word_teaser = new_teaser.join(' ')
    end

    def make_guess
        if @lives > 0
            puts "Enter a letter"

            # create a new variable to capture the user inputted value (gets) and to remove the line break, you use (chomp)
            guess = gets.chomp
            
            # if letter is not part of word, then remove from letters array
            good_guess = @word.first.include? guess

            # check what user input
            if guess == 'exit'
                puts "thank you for playing!"
                
            elsif guess.length > 1
                puts "only 1 letter at a time please!"
                make_guess

            elsif good_guess
                puts "good guess!"

                print_teaser guess

                if @word.first == @word_teaser.split.join
                    puts "yay! you won!"
                else
                    make_guess
                end
            else
                # if guess is wrong, remove number of lives
                @lives -= 1
                puts "sorry... you have #{@lives} guesses left. try again!"
                make_guess
            end
        else
            puts "game over! better luck next time!"
        end
    end
    
    def begin
        # ask user for a letter
        puts "New game started... your word is #{@word.first.size} characters long"
        puts "to exit game at any point, type 'exit'"
        print_teaser

        puts "Clue: #{@word.last}"
        make_guess
    end
end

game = Hangman.new
game.begin