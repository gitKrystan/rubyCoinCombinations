require('sinatra')
require('sinatra/reloader')
require('./lib/coin_combo')
also_reload('./lib/**/*.rb')

get ('/') do
  erb(:index)
end

get('/result') do
  bank_100s = params.fetch('bank_100s').to_i()
  change = params.fetch('change').to_f().*(100).to_i().coin_combo(bank_100s)
  @sacagaweas = change.fetch(100)[0]
  @half_dollars = change.fetch(50)[0]
  @quarters = change.fetch(25)[0]
  @dimes = change.fetch(10)[0]
  @nickles = change.fetch(5)[0]
  @pennies = change.fetch(1)[0]

  @sacagawea_plural = change.fetch(100)[1]
  @half_dollar_plural = change.fetch(50)[1]
  @quarter_plural = change.fetch(25)[1]
  @dime_plural = change.fetch(10)[1]
  @nickle_plural = change.fetch(5)[1]
  @penny_plural = change.fetch(1)[1]

  erb(:result)
end
