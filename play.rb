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
    
    def begin
        # ask user for a letter
        puts 'New game started... your clue is #{}'
    
    end
end