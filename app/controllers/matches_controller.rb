class MatchesController < ApplicationController
  def new
    @match = Match.new
  end

  def create
    match = Match.new(match_params)
    
    i_ids = match_params[:imposter_user_ids].map(&:to_i)
    c_ids = match_params[:crew_user_ids].map(&:to_i)
    imposter_users = User.where(id: i_ids)
    crew_users = User.where(id: c_ids)

    imposter_rate_average = imposter_users.average(:imposter_rate)
    crew_rate_average = crew_users.average(:crew_rate)
    match.imposter_rate_average = imposter_rate_average
    match.crew_rate_average = crew_rate_average
    rate_difference = (imposter_rate_average - crew_rate_average)
    point = 16 - (rate_difference * 0.04)
    match.save
    if match_params[:imposter_win]
      imposter_users.each do |i|
        i.imposter_rate = i.imposter_rate + point
        i.save
      end
      crew_users.each do |c|
        c.crew_rate = c.crew_rate - point
        c.save
      end
    else
      imposter_users.each do |i|
        i.imposter_rate = i.imposter_rate - point
        i.save
      end
      crew_users.each do |c|
        c.crew_rate = c.crew_rate + point
        c.save
      end
    end

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
