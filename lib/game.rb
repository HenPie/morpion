require_relative 'Board'

class Game
  #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.
  attr_accessor :current_player, :board

  def initialize
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
    # On efface l'écran du terminal
    system "clear"
    puts "Bienvenue dans notre jeu Tic Toc Toe !"
    puts "Attention, si tu choisis une case déjà occupée, tu perds ton tour!"
  
    puts "Joueur 1, ton symbole sera X, quel est ton nom ? "
    print ">"
    name_1 = gets.chomp

    # crée le joueur 1
    @player1 = Player.new(name_1, "X")
    puts
    puts "Joueur 2, ton symbole sera O , quel est ton nom ? "
    print ">"
    name_2 = gets.chomp

    # crée le joueur 2
    @player2 = Player.new(name_2, "O")
    @current_player = @player1

    # création du plateau de jeu
    @board = Board.new
  end

  def turn
    #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
    # On boucle tant qu'il n'y a pas de victoire
    loop do
    	puts "============="

    	puts "Voici l'état actuel du jeu:"
    	# Affiche le plateau :
      @board.display_board

      puts "C'est le tour de #{@current_player.name} avec les #{@current_player.symbol}"
      puts "Sélectionne une case parmis celles disponibles"
      print ">"

      # On appelle la méthode play_turn de la classe board sur le joueur en cours (current). Elle demande au joueur quelle case il joue, puis affiche son symbole dans la case
      @board.play_turn(@current_player.symbol)

      # On arrête la boucle en cas de victoire
      if @board.victory? == true
      	system "clear"
		   	puts "============="
        @board.display_board
        puts ""
        puts "#{@current_player.name} a gagné !!!"
        puts
        break
      end

      # Il n'y a pas de victoire : on passe au joueur suivant et on boucle (tour suivant)
      switch_players
    end
  end

  def go
    # lance la partie, j'aurais pu l'utiliser dans mon fichier app.rb dans la class Application
    while @board.victory? == false
      self.turn
    end
  end

  # Passe d'un joueur à l'autre
  def switch_players
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def new_round
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
  end

  def game_end
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
    if @board.victory? == true 
      @board.display_board
      puts "#{current_player.name} a gagné" 
    else 
      puts "Il y a eu égalité, aucun vainqueur"
    end
  end    

end