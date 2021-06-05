class TopController < ApplicationController
	def index
	end
	def show
		@matches = Match.all.order(id: "DESC")
	end
end
