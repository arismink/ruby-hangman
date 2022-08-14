class Hangman
    def initialize      
        # convert to an array
        # once you make a guess, we want to remove that letter from the available letters to guess from
        # instance variable allows you to use it within different methods within the class
        @letters =('a'..'z').to_a
        @word = words.sample
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

    def print_teaser
    
        word_teaser = ""
    
        # run this block of code (do) number of times equal to the length of the first word
        @word.first.size.times do
            word_teaser += "_ "
        end

        puts word_teaser
    end
    
    def begin
        # ask user for a letter
        puts "New game started... your word is #{@word.first.size} characters long"
        print_teaser
        
        puts "Clue: #{@word.last}"
        puts "Enter a letter:"
        # create a new variable to capture the user inputted value (gets) and to remove the line break, you use (chomp)
        guess = gets.chomp

        puts "You guessed #{guess}"
    end
end

game = Hangman.new
game.begin