def initialize      
    class Hangman
    # convert to an array
        # once you make a guess, we want to remove that letter from the available letters to guess from
        letters =('a'..'z').to_a
        word = words.sample
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
    
    
    end
end