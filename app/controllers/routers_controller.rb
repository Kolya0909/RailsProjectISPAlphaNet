class RoutersController < ApplicationController

    before_action :authenticate_user!

    def index
        @routers = Router.all
        @routers_user = current_user.routers
    end

    def add_router

        @routers = Router.all
        @teams = ['admin@ukr.net','grabovich@ukr.net','vladi@ukr.net','igor@ukr.net']



        def get_all_routers_model
                @routers_model = []
                @routers.each do |router|
                @routers_model.push(router.model)
            end
                @routers_model = @routers_model.to_set
        end

        def get_all_routers_name
                @routers_name = []
                @routers.each do |router|
                @routers_name.push(router.name)
            end
                @routers_name = @routers_name.to_set
        end


        # def add_router_to_team
        #      @team = User.find_by(email: params[:team])
        #      @team.routers.push(name: params[:name],model: params[:model],count: params[:count])
        #      @team.save
        #      redirect_to lists_path
        #  end

        get_all_routers_name()
        get_all_routers_model()

        if params[:name]!=nil&&params[:model]!=nil&&params[:count]!=''&&params[:team]!=nil
            #add_router_to_team()
            Router.add_router_to_team(params[:team],params[:name],params[:model],params[:count])
        end








    end

    def new

    end





    def create
        @router = Router.new(routers_params)
        if @router.save
            redirect_to routers_path
        else
            render new_router_path
        end
    end

    private

    def routers_params
        params.require(:routers).permit(:name,:model)
    end

end
