class Game
  def initialize
    puts 'Game Initialized'
    @correct = 0
    @incorrect = 0
    @start_time = Time.now
    @turn = 0
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
    puts @word
  end
  def pass_input
    @user_input = gets.chomp
  end
  def check_input
    if @user_input == 'q'
      self.show_stats
    elsif @user_input == @word[0..-3]
      print "\ncorrect\n"
      @correct += 1
    else
      print "\nincorrect\n"
      @incorrect += 1
    end
  end
  def show_stats
    print "\tStats :\n\tCorrect words: #{@correct}
    \n\tIncorrect words: #{@incorrect}
    \n\tTime passed: #{Time.now - @start_time}"
  end
end

game = Game.new
game.make_word
game.show_word
game.pass_input
game.check_input
game.pass_input
game.check_input
