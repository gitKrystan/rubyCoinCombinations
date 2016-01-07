class Fixnum
coins = { 100 => ["Sacagawea", "Sacagaweas"],
          50 => ["half dollar", "half dollars"],
          25 => ["quarter", "quarters"],
          10 => ["dime", "dimes"],
          5 => ["nickle", "nickles"],
          1 => ["penny", "pennies"] }


  define_method(:coin_combo) do
    money_left = self
    combos = []

    counter = 0
    until counter == coins.length()
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

    if combos.length() > 1
      combos[-1].prepend("and ")
    end

    if combos.length() > 2
      return combos.join(", ")
    else
      return combos.join(" ")
    end
  end
end
