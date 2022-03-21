class MutantsController < ApplicationController
  
  rescue_from Exception do |e|
    render json: {error: e.message}, status: :internal_error
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: {error: e.message}, status: :not_found
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: {error: e.message}, status: :unprocessable_entity
  end

  # POST /mutant
  def index
    is_mutant = MutantService.run params['dna']
    render json: {is_mutant: is_mutant}, status: is_mutant ? :ok : :not_found
  end
end
