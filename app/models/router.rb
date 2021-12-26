class Router < ApplicationRecord
    validates :model, uniqueness: true

    
    def self.add_router_to_team(team,router_name,router_model,router_count)

        user = User.find_by(email: team) #Получаем юзера
        all_routers_team = user.routers #получаем роутеры юзера
        all_routers_team.each do |router| # Проверяем есть ли у нашего юзера тот роутер что нам нужно добавить(если нет создаем этот роутер)
            if router[:name] == router_name&&router[:model] == router_model
                old_router_count = router[:count]
                new_router_count = old_router_count.to_i + router_count.to_i
                router[:count] = new_router_count
            end
        end
        
        user.routers = all_routers_team
        user.save
        
    end
    

    

end
