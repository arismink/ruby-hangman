class Hangman
    def initialize      
        # convert to an array
        # once you make a guess, we want to remove that letter from the available letters to guess from
        # instance variable allows you to use it within different methods within the class
        @letters =('a'..'z').to_a
        @word = words.sample
        @lives = 7
        @correct_guesses = []
        @word_teaser = ''
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

    def print_teaser last_guess
    
        word_teaser = ""
        
        # we only want to call this method if the last_guess is not nil
        update_teaser unless last_guess.nil?

        puts word_teaser
    end

    def make_guess
        if @lives > 0
            puts "Enter a letter"
            guess = gets.chomp
            
            # if letter is not part of word, then remove from letters array
            good_guess = @word.first.include? guess

            if good_guess
                puts "good guess!"

                # store guesses in the array
                @correct_guesses << guess

                # remove correct guess from alphabet
                # it will delete guess from the letters array
                @letters.delete guess

                print_teaser
                make_guess
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
        print_teaser

        puts "Clue: #{@word.last}"
        make_guess

        # create a new variable to capture the user inputted value (gets) and to remove the line break, you use (chomp)
        guess = gets.chomp

        puts "You guessed #{guess}"
    end
end

game = Hangman.new
game.begin