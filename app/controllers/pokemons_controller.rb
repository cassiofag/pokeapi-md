class PokemonsController < ApplicationController
  include Paginable

  def index
    paginated_result = paginate(Pokemon.pokedex_order)
    render_collection(paginated_result)
  end

  def serializer
    PokemonSerializer
  end
end