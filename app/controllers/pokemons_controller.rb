class PokemonsController < ApplicationController
  include Paginable

  def index
    paginated_result = paginate(Pokemon.pokedex_order)
    render_collection(paginated_result)
  end

  def show
    pokemon = Pokemon.find(params[:id])
    render json: serializer.new(pokemon), status: :ok
  end

  def serializer
    PokemonSerializer
  end
end