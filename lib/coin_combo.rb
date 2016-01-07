class Fixnum
  coins = { 100 => ["Sacagawea", "Sacagaweas", 2],
            50 => ["half dollar", "half dollars", 2],
            25 => ["quarter", "quarters", 2],
            10 => ["dime", "dimes", 2],
            5 => ["nickle", "nickles", 2],
            1 => ["penny", "pennies"] }

  define_method(:coin_combo) do |available_100|
    money_left = self
    change = Hash.new()

    coins[100][2] = available_100

    counter = 0
    until counter == coins.length() - 1
      coin_value = coins.keys[counter]
      required_coins = (money_left / coin_value).floor()
      if required_coins <= coins.fetch(coin_value)[2]
        money_left -= required_coins * coin_value
        required_coins.entry_generator(change, coin_value)
      else
        actual_coins = coins.fetch(coin_value)[2]
        money_left -= actual_coins * coin_value
        actual_coins.entry_generator(change, coin_value)
      end
      counter += 1
    end
    money_left.entry_generator(change, 1)
    return change
  end

  define_method(:entry_generator) do |change, coin_value|
    # combo_entry = self.to_s()
    if self == 1
      change.store(coin_value, [self, coins.fetch(coin_value)[0]])
      # change.push(combo_entry)
      # change.push(coins.fetch(coin_value)[0])
    elsif (self > 1) || (self == 0)
      change.store(coin_value, [self, coins.fetch(coin_value)[1]])
      # change.push(combo_entry)
      # change.push(coins.fetch(coin_value)[1])
    end
  end
end


    # if change.length() > 1
    #   # change[-1].prepend("and ")
    # end
    #
    # if change.length() > 2
    #   # return change.join(", ")
    # else
    #   # return change.join(" ")
    # end
