class OntsController < ApplicationController
	before_action :authenticate_user!
	
	def index
	Ont.delete_all
	end
	

	def new 
	@teams = ['Оберіть','admin@ukr.net','grabovich@ukr.net','vladi@ukr.net','igor@ukr.net']
	end

	
	def edit
	@teams = ['Оберіть','grabovich@ukr.net','vladi@ukr.net','igor@ukr.net']
	end

	def update
	
	end


	def create
		
	@ont = Ont.new(onts_params)
	@ont.save
	
	end

	def addonu
        @teams = ['Оберіть','admin@ukr.net','grabovich@ukr.net','vladi@ukr.net','igor@ukr.net']
       	
	 
	if params[:team]&&params[:count]
         @ont = Ont.all
	 @ont = @ont.addOnuInTable(params[:count],params[:team])
	end

	end

	

        private def onts_params
		params.require(:ont).permit(:count,:team)	
	end
end
