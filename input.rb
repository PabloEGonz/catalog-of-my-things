class Input
  def getter(msj, is_number: false)
    print msj
    is_number ? gets.chomp.to_i : gets.chomp
  end
end
