class Api::V1::PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.paginate(page: params[:page], per_page: 10)
    render json: @pokemons, status: :ok
  end

  def show
    @pokemon = Pokemon.find_by(id: params[:id])

    if @pokemon
      render json: @pokemon, status: :ok
    else
      render json: { error: "Pokemon not found" }, status: :not_found
    end
  end

  def create
    pokemon = Pokemon.new(pokemon_params)
    if pokemon.save
      render json: { status: 'SUCCESS', message: 'Pokemon created successfully', pokemon: pokemon}, status: :created
    else
      render json: { status: 'ERROR', message: 'Failed to create Pokemon', errors: pokemon.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    @pokemon = Pokemon.find_by(id: params[:id])

    if @pokemon.update(pokemon_params)
      render json: { status: 'SUCCESS', message: 'Pokemon updated successfully', pokemon: pokemon}
    else
      render json: { error: "Failed to update Pokemon" }, status: :unprocessable_entity
    end
  end

  def destroy
    @pokemon = Pokemon.find_by(id: params[:id])

    if @pokemon.destroy
      head :no_content
    else
      render json: { error: "Failed to delete Pokemon" }, status: :unprocessable_entity
    end
  end

  private
  def pokemon_params
    params.permit(:name,
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
                  :legendary)
  end
end
