require 'rails_helper'

RSpec.describe '/pokemons routes' do
  it 'should routes to pokemons#index' do
    expect(get '/pokemons').to route_to('pokemons#index')
  end

  it 'should routes to pokemons#show' do
    expect(get '/pokemons/1').to route_to('pokemons#show', id: '1')
  end

  it 'should routes to pokemons#create' do
    expect(post '/pokemons').to route_to('pokemons#create')
  end

  it 'should routes to pokemons#update' do
    expect(put '/pokemons/1').to route_to('pokemons#update', id: '1')
    expect(patch '/pokemons/1').to route_to('pokemons#update', id: '1')
  end

  it 'should routes to pokemon#destroy' do
    expect(delete '/pokemons/1').to route_to('pokemons#destroy', id: '1')
  end
end