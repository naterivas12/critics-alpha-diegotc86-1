class CompaniesController < ApplicationController
  # GET /companies
  def index
    companies = Company.all
    render json: companies
  end

  # POST /companies
  def create
    company = Company.new(company_params)

    if company.save
      render json: company, status: :created
    else
      render json: { errors: company.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # GET /companies/:id
  def show
    company = Company.find(params[:id])
    render json: company
  end

  # PATCH /companies/:id
  def update
    company = Company.find(params[:id])

    if company.update(company_params)
      render json: company
    else
      render json: { errors: company.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /companies/:id
  def destroy
    company = Company.find(params[:id])
    company.destroy
    render json: nil, status: :no_content
  end

  private

  def company_params
    params.require(:company).permit(:name, :description, :country, :start_date)
  end
end
