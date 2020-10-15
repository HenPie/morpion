require_relative 'BoardCase'

class Board
  #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
  attr_accessor :board , :count_turn


  def initialize
    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
    @board =  [*0..8].map { |i|  BoardCase.new(i).case_number }
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " ----------- "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " ----------- "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def play_turn(symbol)
    #TO DO : une méthode qui :
    #1) demande au bon joueur ce qu'il souhaite faire
    #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
    case_number = gets.chomp().to_i
    @board = @board.each_index.map { |e| e == case_number && @board[e] != "X" && @board[e] != "O" ? @board[e] = symbol : @board[e] }
  end

  def turn_count(board)
    @count_turn = 0
    @board.each do |index|
      if @board[index] == "X" || @board[index] = "O"
        @count_turn += 1
      end
    end
    @count_turn
  end

  def victory?
    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
    if
      #Les cas possibles de victoire
      (@board[0] == @board[1]) && (@board[1] == @board[2]) ||
      (@board[3] == @board[4]) && (@board[3] == @board[5]) ||
      (@board[6] == @board[7]) && (@board[6] == @board[8]) ||
      (@board[0] == @board[3]) && (@board[0] == @board[6]) ||
      (@board[1] == @board[4]) && (@board[1] == @board[7]) ||
      (@board[2] == @board[5]) && (@board[2] == @board[8]) ||
      (@board[0] == @board[4]) && (@board[0] == @board[8]) ||
      (@board[2] == @board[4]) && (@board[2] == @board[6])
      #On affecte true s'il y a un victoire
        return true
      else
      #Sinon on affecte false 
        return false
    end
  end

end