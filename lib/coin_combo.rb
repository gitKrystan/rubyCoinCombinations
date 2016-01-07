class Fixnum
coins = {       25 => ["quarter", "quarters"],
                10 => ["dime", "dimes"],
                5 => ["nickle", "nickles"],
                1 => ["penny", "pennies"] }


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
      combo_entry = num_of_coins.to_s() + " "
      if num_of_coins == 1
        combos.push(combo_entry + coins.fetch(coin_value)[0])
      elsif num_of_coins > 1
        combos.push(combo_entry + coins.fetch(coin_value)[1])
      end
      counter += 1
    end
    return combos.join(" ")
  end
end
