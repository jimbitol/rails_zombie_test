class BrainsController < ApplicationController

	before_filter :get_zombie

	def get_zombie
		@zombie = Zombie.find(params[:zombie_id])
	end

	def index
		@brains = @zombie.brains
	end

	def show
		@brains = @zombie.brains.find(params[:id])
	end
end
