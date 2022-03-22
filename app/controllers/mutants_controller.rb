class MutantsController < ApplicationController
  
  # POST /mutant
  def index
    is_mutant = MutantService.run params['dna']
    render json: {is_mutant: is_mutant}, status: is_mutant ? :ok : :forbidden
  end

  def stats
    render json: StatService.stats 
  end
end
