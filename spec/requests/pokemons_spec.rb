require 'rails_helper'

RSpec.describe PokemonsController do
  describe '#index' do
    it 'should return 200 status code' do
      get '/pokemons'
      expect(response).to have_http_status(:ok)
    end

    it 'should return a proper json' do
      pokemon = FactoryBot.create(:pokemon)
      get '/pokemons'
      expect(json_data.length).to eq(1)
      expected = json_data.first

      aggregate_failures do
        expect(expected[:id]).to eq(pokemon.id.to_s)
        expect(expected[:type]).to eq('pokemon')
        expect(expected[:attributes]).to eq(
          {
            pokedex_number: pokemon.pokedex_number,
            name: pokemon.name,
            type_1: pokemon.type_1,
            type_2: pokemon.type_2,
            total: pokemon.total,
            hp: pokemon.hp,
            attack: pokemon.attack,
            defense: pokemon.defense,
            sp_atk: pokemon.sp_atk,
            sp_def: pokemon.sp_def,
            speed: pokemon.speed,
            generation: pokemon.generation,
            legendary: pokemon.legendary
          }
        )
      end
    end

    it 'should return pokemons ordered by their pokedex_number' do
      pokemon_first = FactoryBot.create(:pokemon, id: 10, pokedex_number: 2)
      pokemon_last = FactoryBot.create(:pokemon, id: 1, pokedex_number: 4)

      get '/pokemons'
      pokemon_ids = json_data.map { |item| item[:id].to_i }
      expect(pokemon_ids).to eq([
        pokemon_first.id,
        pokemon_last.id
      ])
    end

    it 'should paginate results' do
      pokemon1, pokemon2, pokemon3 = create_list(:pokemon, 3)

      get '/pokemons', params: { page: { number: 2, size: 1 } }
      expect(json_data.length).to eq(1)
      expect(json_data.first[:id]).to eq(pokemon2.id.to_s)
    end

    it 'should contain pagination links' do
      pokemon1, pokemon2, pokemon3 = create_list(:pokemon, 3)

      get '/pokemons', params: { page: { number: 2, size: 1 } }
      expect(json[:links].length).to eq(5)
      expect(json[:links].keys).to contain_exactly(
        :first, :prev, :next, :last, :self
      )
    end
  end

  describe '#show' do
    let(:pokemon) { create(:pokemon) }
    subject { get "/pokemons/#{pokemon.id}" }
    before { subject }

    it 'should return 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return a proper json' do
      aggregate_failures do
        expect(json_data[:id]).to eq(pokemon.id.to_s)
        expect(json_data[:type]).to eq('pokemon')
        expect(json_data[:attributes]).to eq(
          {
            pokedex_number: pokemon.pokedex_number,
            name: pokemon.name,
            type_1: pokemon.type_1,
            type_2: pokemon.type_2,
            total: pokemon.total,
            hp: pokemon.hp,
            attack: pokemon.attack,
            defense: pokemon.defense,
            sp_atk: pokemon.sp_atk,
            sp_def: pokemon.sp_def,
            speed: pokemon.speed,
            generation: pokemon.generation,
            legendary: pokemon.legendary
          }
        )
      end
    end

    context 'when the record is not found' do
      subject { get '/pokemons/x' }

      it 'should return a 404 status code' do
        subject
        expect(response).to have_http_status(:not_found)
      end

      it 'should return a proper error json' do
        subject
          expect(json[:errors]).to include(
            title: 'Record not Found',
            status: "404",
            detail: 'We could not find the object you were looking for.',
            source: { pointer: '/request/url/:id' }
          )
      end
    end
  end

  describe '#create' do
    subject { post '/pokemons' }
    context 'when invalid parameters provided' do
      let(:invalid_attributes) do
        {
          data: {
            attributes: {
              pokedex_number: nil,
              name: '',
              type_1: '',
              total: 0
            }
          }
        }
      end
      subject { post '/pokemons', params: invalid_attributes }

      it 'should return 422 status code' do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'should return proper error json' do
        subject
        expect(json[:errors]).to include(
          {
            detail: "can't be blank",
            source: { pointer: "/data/attributes/pokedex_number" },
            status: "422",
            title: "invalid request"
          },
          {
            detail: "is not a number",
            source: { pointer: "/data/attributes/pokedex_number" },
            status: "422",
            title: "invalid request"
          },
          {
            detail: "can't be blank",
            source: { pointer: "/data/attributes/name" },
            status: "422",
            title: "invalid request"
          },
          {
            detail: "can't be blank",
            source: { pointer: "/data/attributes/type_1" },
            status: "422",
            title: "invalid request"
          },
          {
            detail: "must be greater than 0",
            source: { pointer: "/data/attributes/total" },
            status: "422",
            title: "invalid request"
          },
          {
            detail: "can't be blank",
            source: { pointer: "/data/attributes/hp" },
            status: "422",
            title: "invalid request"
          },
          {
            detail: "is not a number",
            source: { pointer: "/data/attributes/hp" },
            status: "422",
            title: "invalid request"
          },
          {
            detail: "can't be blank",
            source: { pointer: "/data/attributes/attack" },
            status: "422",
            title: "invalid request"
          },
          {
            detail: "is not a number",
            source: { pointer: "/data/attributes/attack" },
            status: "422",
            title: "invalid request"
          },
          {
            detail: "can't be blank",
            source: { pointer: "/data/attributes/defense" },
            status: "422",
            title: "invalid request"
          },
          {
            detail: "is not a number",
            source: { pointer: "/data/attributes/defense" },
            status: "422",
            title: "invalid request"
          },
          {
            detail: "can't be blank",
            source: { pointer: "/data/attributes/sp_atk" },
            status: "422",
            title: "invalid request"
          },
          {
            detail: "is not a number",
            source: { pointer: "/data/attributes/sp_atk" },
            status: "422",
            title: "invalid request"
          },
          {
            detail: "can't be blank",
            source: { pointer: "/data/attributes/sp_def" },
            status: "422",
            title: "invalid request"
          },
          {
            detail: "is not a number",
            source: { pointer: "/data/attributes/sp_def" },
            status: "422",
            title: "invalid request"
          },
          {
            detail: "can't be blank",
            source: { pointer: "/data/attributes/speed" },
            status: "422",
            title: "invalid request"
          },
          {
            detail: "is not a number",
            source: { pointer: "/data/attributes/speed" },
            status: "422",
            title: "invalid request"
          },
          {
            detail: "can't be blank",
            source: { pointer: "/data/attributes/generation" },
            status: "422",
            title: "invalid request"
          },
          {
            detail: "is not a number",
            source: { pointer: "/data/attributes/generation" },
            status: "422",
            title: "invalid request"
          },
          {
            detail: "must be true or false",
            source: { pointer: "/data/attributes/legendary" },
            status: "422",
            title: "invalid request"
          }
        )
      end
    end

    context 'when success request sent' do
      
    end
  end
end