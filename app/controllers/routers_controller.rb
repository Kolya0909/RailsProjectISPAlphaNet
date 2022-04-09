class RoutersController < ApplicationController

    before_action :authenticate_user!

    def index
        @routers = Router.all
        @routers_user = current_user.routers
        @admin = User.find_by_email("admin@ukr.net")
        #@grabovich =  User.find_by_email('grabovich@ukr.net')
        # @slava = User.find_by_email('slava@ukr.net')
        #@igor = User.find_by_email('igor@ukr.net')
        @vladi = User.find_by_email('vladi@ukr.net')
    end

    def add_router

        @routers = Router.all
        @teams = ['admin@ukr.net','grabovich@ukr.net','vladi@ukr.net','igor@ukr.net']

        def get_all_routers_model               #Создает сет с моделями роутеров
                @routers_model = []
                @routers.each do |router|
                @routers_model.push(router.model)
            end
                @routers_model = @routers_model.to_set
        end

        def get_all_routers_name                #Создает сет с брендами роутеров
                @routers_name = []
                @routers.each do |router|
                @routers_name.push(router.name)
            end
                @routers_name = @routers_name.to_set
        end
        
        get_all_routers_name()
        get_all_routers_model()

        if params[:name]!=nil&&params[:model]!=nil&&params[:count]!=''&&params[:team]!=nil
            Router.add_router_to_team(params[:team],params[:name],params[:model],params[:count]) #Добавляет роутер к юзерам
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
