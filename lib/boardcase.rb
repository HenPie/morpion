class BoardCase
  #la classe a deux attr_accessor : sa valeur ("X", "O", ou vide), et son numéro de case.
  attr_accessor :value, :case_number
  
  def initialize(case_number)
    @value = ""
    @case_number = case_number
  end
  
  def to_s
    # renvoie la valeur au format string
    self.value = @value 
  end

end