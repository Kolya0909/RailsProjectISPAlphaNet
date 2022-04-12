class UseRoutersController < ApplicationController

  def index
    @usedRoutersAll = UsedRouter.all
    @usedRouters = UsedRouter.where(user_id: current_user.id)
  end



end
