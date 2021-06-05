class TopController < ApplicationController
	def index
		@imposter_top_users = User.limit(10).order(imposter_rate: "DESC")
		@crew_top_users = User.limit(10).order(crew_rate: "DESC")
	end
	def show
		@matches = Match.all.order(id: "DESC")
	end
end
