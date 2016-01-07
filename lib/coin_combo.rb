class Fixnum
coins = {       25 => "quarter",
                10 => "dime",
                5 => "nickle",
                1 => "penny" }


  define_method(:coin_combo) do
    # num_of_pennies = self % coin_values.key("nickle")
    # number_of_nickles = (self - after_nickles) / 5
    # return number_of_nickles.to_s() + " nickles"

    money_left = self
    combos = []
    counter = 0
    until counter == 4
      coin_value = coins.keys[counter]
      num_of_coins = (money_left / coin_value).floor()
      money_left -= num_of_coins * coin_value
      if num_of_coins > 0
        combos.push(num_of_coins.to_s() + " " + coins.fetch(coin_value))
      end
      counter += 1
    end
    return combos.join(" ")
  end
end
