class GamesController < ApplicationController
  # GET /games
  def index
    games = Game.all
    render json: games
  end

  # POST /games
  def create
    game = Game.new(game_params)

    if game.save
      render json: game, status: :created
    else
      render json: { errors: game.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # GET /games/:id
  def show
    game = Game.find(params[:id])
    render json: game
  end

  # PATCH /games/:id
  def update
    game = Game.find(params[:id])

    if game.update(game_params)
      render json: game
    else
      render json: { errors: game.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /games/:id
  def destroy
    game = Game.find(params[:id])
    game.destroy
    render json: nil, status: :no_content
  end

  # POST /games/:id/add_genre
  def add_genre
    game = Game.find(params[:id])
    genre = Genre.find(params[:genre_id])
    game.genres << genre

    render json: game.genres, status: :created
  end

  # DELETE /games/:id/remove_genre
  def remove_genre
    game = Game.find(params[:id])
    genre = Genre.find(params[:genre_id])
    game.genres.delete(genre)

    render json: game.genres, status: :created
  end

  private

  def game_params
    params.require(:game).permit(:name, :summary, :release_date, :category, :cover, :rating,
                                 :parent_id)
  end
end
