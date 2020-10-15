class Player
  # La classe a deux attr_accessor : son nom, et son symbole (X ou O).
  attr_accessor :name, :symbol
  
  def initialize(name_to_save, symbol_to_save)
    # nom du joueur, symbole avec lequel il joue
    @name = name_to_save
    @symbol = symbol_to_save
  end

end