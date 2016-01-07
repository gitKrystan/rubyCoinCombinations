require('rspec')
require('coin_combo')
require('pry')

describe('Fixnum#coin_combo') do
  it('returns one coin if the number is evenly divisible by a coin value') do
    expect(1.coin_combo())
      .to(eq({100 => [ 0, "Sacagaweas" ],
              50 =>[ 0, "half dollars" ],
              25 =>[ 0, "quarters" ],
              10 =>[ 0, "dimes" ],
              5 =>[ 0, "nickles" ],
              1 =>[ 1, "penny" ]}))
  end

  it('returns a combination of coins when more than one coin type is required') do
    expect(26.coin_combo())
      .to(eq({100 => [ 0, "Sacagaweas" ],
              50 =>[ 0, "half dollars" ],
              25 =>[ 1, "quarter" ],
              10 =>[ 0, "dimes" ],
              5 =>[ 0, "nickles" ],
              1 =>[ 1, "penny" ]}))
  end

  it('returns a plural coin name when more than one of that coin type is required') do
    expect(20.coin_combo())
      .to(eq({100 => [ 0, "Sacagaweas" ],
              50 =>[ 0, "half dollars" ],
              25 =>[ 0, "quarters" ],
              10 =>[ 2, "dimes" ],
              5 =>[ 0, "nickles" ],
              1 =>[ 0, "pennies" ]}))
  end

  it('does not return unavailable coins') do
    expect(302.coin_combo())
      .to(eq({100 => [ 2, "Sacagaweas" ],
              50 =>[ 2, "half dollars" ],
              25 =>[ 0, "quarters" ],
              10 =>[ 0, "dimes" ],
              5 =>[ 0, "nickles" ],
              1 =>[ 2, "pennies" ]}))
  end

  it('returns unlimited pennies') do
    expect(400.coin_combo())
      .to(eq({100 => [ 2, "Sacagaweas" ],
              50 =>[ 2, "half dollars" ],
              25 =>[ 2, "quarters" ],
              10 =>[ 2, "dimes" ],
              5 =>[ 2, "nickles" ],
              1 =>[ 20, "pennies" ]}))
    end
end
