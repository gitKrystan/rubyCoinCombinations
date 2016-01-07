class Fixnum
coins = { 100 => ["Sacagawea", "Sacagaweas", 2],
          50 => ["half dollar", "half dollars", 2],
          25 => ["quarter", "quarters", 2],
          10 => ["dime", "dimes", 2],
          5 => ["nickle", "nickles", 2],
          1 => ["penny", "pennies", 2] }


  define_method(:coin_combo) do
    money_left = self
    combos = []

    counter = 0
    until counter == coins.length()
      coin_value = coins.keys[counter]
      required_coins = (money_left / coin_value).floor()
      if required_coins <= coins.fetch(coin_value)[2]
        money_left -= required_coins * coin_value
        required_coins.entry_generator(combos, coin_value)
      else
        actual_coins = coins.fetch(coin_value)[2]
        money_left -= actual_coins * coin_value
        actual_coins.entry_generator(combos, coin_value)
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

  define_method(:entry_generator) do |combos, coin_value|
    combo_entry = self.to_s() + " "
    if self == 1
      combos.push(combo_entry + coins.fetch(coin_value)[0])
    elsif self > 1
      combos.push(combo_entry + coins.fetch(coin_value)[1])
    end
  end
end
