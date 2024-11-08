class CriticsController < ApplicationController
  # GET /companies/:company_id/critics
  # GET /games/:game_id/critics
  def index
    if params[:company_id]
      company = Company.find(params[:company_id])
      render json: company.critics
    elsif params[:game_id]
      game = Game.find(params[:game_id])
      render json: game.critics
    end
  end

  # POST /companies/:company_id/critics
  # POST /games/:game_id/critics
  def create
    if params[:company_id]
      company = Company.find(params[:company_id])
      critic = company.critics.new(critic_params)
    elsif params[:game_id]
      game = Game.find(params[:game_id])
      critic = game.critics.new(critic_params)
    end

    if critic.save
      render json: critic, status: :created
    else
      render json: { errors: critic.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # GET /companies/:company_id/critics/:id
  # GET /games/:game_id/critics/:id
  def show
    if params[:company_id]
      company = Company.find(params[:company_id])
      render json: company.critics.find(params[:id])
    elsif params[:game_id]
      game = Game.find(params[:game_id])
      render json: game.critics.find(params[:id])
    end
  end

  # PATCH/PUT	/companies/:company_id/critics/:id
  # PATCH/PUT	/games/:game_id/critics/:id
  def update
    if params[:company_id]
      company = Company.find(params[:company_id])
      critic = company.critics.find(params[:id])
    elsif params[:game_id]
      game = Game.find(params[:game_id])
      critic = game.critics.find(params[:id])
    end

    if critic.update(critic_params)
      render json: critic, status: :created
    else
      render json: { errors: critic.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE	/companies/:company_id/critics/:id
  # DELETE	/games/:game_id/critics/:id
  def destroy
    if params[:company_id]
      company = Company.find(params[:company_id])
      critic = company.critics.find(params[:id])
    elsif params[:game_id]
      game = Game.find(params[:game_id])
      critic = game.critics.find(params[:id])
    end

    critic.destroy

    render json: nil, status: :no_content
  end

  private

  def critic_params
    params.require(:critic).permit(:title, :body, :user_id)
  end
end
