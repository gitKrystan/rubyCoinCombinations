require('rspec')
require('coin_combo')
require('pry')

describe('Fixnum#coin_combo') do
  it('returns one coin if the number is evenly divisible by a coin value') do
    expect(1.coin_combo()).to(eq("1 penny"))
    expect(25.coin_combo()).to(eq("1 quarter"))
  end

  it('returns a combination of coins when more than one coin type is required') do
    expect(26.coin_combo()).to(eq("1 quarter 1 penny"))
  end

  it('returns a plural coin name when more than one of that coin type is required') do
    expect(50.coin_combo()).to(eq("2 quarters"))
  end

  it('returns grammatically correct plural coin names') do
    expect(2.coin_combo()).to(eq("2 pennies"))
  end

  it('returns plural names for multiple coin types') do
    expect(7.coin_combo()).to(eq("1 nickle 2 pennies"))
  end
end
