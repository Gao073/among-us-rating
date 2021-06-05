class MatchesController < ApplicationController
  def new
    @match = Match.new
  end

  def create
    @match = Match.create(match_params)
    binding.pry
    imposter_
  end

  def update
  end

  def edit
  end

  def destroy
  end
  private
  def match_params
    params.require(:match).permit(:imposter_win, imposter_user_ids: [], crew_user_ids: []).merge(creator_id: current_user.id)
  end
end
