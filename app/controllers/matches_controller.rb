class MatchesController < ApplicationController
  def new
    @match = Match.new
  end

  def create
    @match = Match.create(match_params)
  end

  def update
  end

  def edit
  end

  def destroy
  end
  private
  def match_params
    binding.pry
    params.require(:match).permit(:impster_win, imposter_user_ids: [], crew_user_ids: []).merge(creator_id: current_user.id)
  end
end
