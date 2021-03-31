require 'rails_helper'

RSpec.describe '/pokemons routes' do
  it 'routes to pokemons#index' do
    expect(get '/pokemons').to route_to('pokemons#index')
  end

  it 'routes to pokemons#show' do
    expect(get '/pokemons/1').to route_to('pokemons#show', id: '1')
  end
end