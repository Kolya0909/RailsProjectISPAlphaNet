module GetInfoOfRouter
    @routers = Router.all

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
end