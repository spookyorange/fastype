class Game
  attr_reader :finish
  def initialize
    print "\n\n\t\tstart - to start the game
           \n\t\thelp - to get help
           \n\t\tq - to end game and see your stats\n\n\t:"
    @game_starts = 0
    while @game_starts == 0
      @first_prompt = gets.chomp.downcase
      if @first_prompt == 'help'
      print "\n\n\t\tstart - to start the game
             \n\t\thelp - to get help
             \n\t\tq - to end game and see your stats
             \n\t\tyou will get a word when the game starts,
             \n\t\tyou enter the word and press enter,
             \n\t\tpress q to end the game and see your stats
             \n\t\twords per minute and letters per second are
             \n\t\tbeing calculated by correct words
             \n\t\tEnjoy !\n\n\t:"
      elsif @first_prompt == 'start'
        print "\n\n\t\tGame Initialized !\n\n"
        @game_starts = 1
      else
        print "\n\t\tPlease enter a valid input\n\t:"
      end
    end
    @correct = 0
    @incorrect = 0
    @start_time = Time.now
    @turn = 0
    @lps = 0
    @wpm = 0
    @total_letters = 0
    @finish = 0
  end
  def make_word 
  all_words = File.readlines('5desk.txt')
  selectable_words = Array.new
  all_words.each do |word|
    if word.length > 6 && word.length < 13
      selectable_words.unshift(word)
    end
  end
  @word = selectable_words[rand(selectable_words.size - 1)].downcase
  end
  def show_word
    print "\n\t#{@word}\n\n\t:"
  end
  def pass_input
    @user_input = gets.chomp
  end
  def check_input
    if @user_input == 'q'
      self.show_stats
    elsif @user_input == @word[0..-3]
      print "\n\t\t\t\tcorrect\n"
      @correct += 1
      @total_letters += @word[0..-3].size
    else
      print "\n\t\t\t\tincorrect\n"
      @incorrect += 1
    end
  end
  def show_stats
    @lps = @total_letters / (Time.now - @start_time)
    @wpm = @correct / ((Time.now - @start_time) / 60)
    print "\n\tStats :\n\tCorrect words: #{@correct}
    \n\tIncorrect words: #{@incorrect}
    \n\tTime passed(s): #{Time.now - @start_time}
    \n\tWords per minute: #{@wpm}
    \n\tLetters per second: #{@lps}\n\n"
    @finish = 1
  end
end

game = Game.new
while game.finish != 1 do
  game.make_word
  game.show_word
  game.pass_input
  game.check_input
end
