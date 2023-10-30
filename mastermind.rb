# Color object holder and game methods
class MasterMind
  def initialize
    @color_array = []
    @color_holder = %w[red yellow orange green blue]
    for i in 1..4 do
      color = @color_holder.sample
      @color_array.push(color)
    end
    @guess_array = %w[blank blank blank blank]
    puts 'Welcome to Mastermind. In this game, you will attempt to guess the correct pattern of four colors. The possible colors are: red, yellow, orange, green, and blue. The sequence may be any combination of these colors, including dupilcates.'
  end

  def game
    puts 'Do you want to guess the pattern or create the pattern? Enter 1 for guessing the pattern, and 2 for creating the pattern.'
    @player = 'You'
    d = gets.chomp
    if d == '2'
      @player = 'Computer'
      creator
    else
      puts 'When asked to make your guess, type in a sequence of four colors, separated by spaces. You will have 12 chances to guess the sequence. Good luck!'
    end
    win = false
    for i in 1..12
      puts
      puts "Enter guess ##{i}: "
      if d == '1'
        g = gets.chomp.split()
      elsif d == '2'
        g = computer_guess

      end

      if guessing(g) == true
        win = true
        break
      end
    #   @guess_array = []
    #   g.each_with_index do |col, j|
    #     if @color_array[j] == "guessed"
    #       @guess_array.push(col)
    #     elsif @color_array[j] == col
    #       @guess_array.push(col)
    #       @color_array[j] = "guessed"
    #     elsif @color_array.any?(col)
    #       @guess_array.push("white")
    #     else
    #       @guess_array.push("blank")
    #     end
    #   end
    #   puts @guess_array.inspect
    #   if @color_array.all?("guessed")
    #     win = true
    #     break
    #   end
    end
    if win == true
      puts "#{@player} win!"
    else
      p @color_array
      puts "#{@player} lose!"
    end
  end

  def creator
    puts 'Please enter a sequence of four colors consisting of red, yellow, orange, green, and blue.'
    @color_array = gets.chomp.split()
  end

  def guessing(g)
    @guess_array = []
    g.each_with_index do |col, j|
      if @color_array[j] == col
        @guess_array.push(col)
      elsif @color_array.any?(col)
        @guess_array.push('white')
      else 
        @guess_array.push('blank')
      end
    end
    p @guess_array
    @color_array == @guess_array
  end

  def computer_guess
    computer_guess = []
    for i in 1..4
      computer_guess.push(@color_holder.sample)
    end
    @guess_array.each_with_index do |col, j|
      if @color_holder.include?(col)
        computer_guess[j] = col
      end
    end
    p computer_guess
    computer_guess
  end
end

play_game = 'Y'
while play_game == 'Y'
  new_mind = MasterMind.new
  new_mind.game
  puts 'Do you want to play again? Enter y/n'
  play_game = gets.chomp.upcase
  puts
end

puts 'Thank you for playing'
