class PokemonsController < ApplicationController
  include Paginable

  def index
    paginated_result = paginate(Pokemon.pokedex_order)
    render_collection(paginated_result)
  end

  def show
    pokemon = Pokemon.where(pokedex_number: params[:id])
    if pokemon.empty?
      raise ActiveRecord::RecordNotFound
    end
    render json: serializer.new(pokemon), status: :ok
  end

  def create
    pokemon = Pokemon.create!(pokemon_params)
    pokemon.save!
    render json: serializer.new(pokemon), status: :created
  end

  def update
    pokemon = Pokemon.find(params[:id])
    pokemon.update!(pokemon_params)
    render json: serializer.new(pokemon), status: :ok
  end

  def destroy
    pokemon = Pokemon.find(params[:id])
    pokemon.destroy!
    head :no_content
  end

  def pokemon_params
    params.require(:data).require(:attributes).permit(
      :pokedex_number,
      :name,
      :type_1,
      :type_2,
      :total,
      :hp,
      :attack,
      :defense,
      :sp_atk,
      :sp_def,
      :speed,
      :generation,
      :legendary
    ) ||
    ActionController::Parameters.new
  end

  def serializer
    PokemonSerializer
  end
end