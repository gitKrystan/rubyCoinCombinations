require('rspec')
require('coin_combo')
require('pry')

describe('Fixnum#coin_combo') do
  it('returns one coin if the number is evenly divisible by a coin value') do
    expect(1.coin_combo()).to(eq("1 penny"))
    expect(25.coin_combo()).to(eq("1 quarter"))
  end
end
