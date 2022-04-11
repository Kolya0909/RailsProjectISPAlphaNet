class ListsController < ApplicationController
	
	before_action :authenticate_user!

	def index
		@routers_user = current_user.routers
  		@works = ['Оберіть вид роботи','Підключення клієнта','Ремонт клієнта']
        @statuses = ['Оберіть статус', 'В роботі', 'Підключено']
        @teams = ['Оберіть бригаду','grabovich@ukr.net','vladi@ukr.net','igor@ukr.net']
		@lists = List.all

		if params[:q]
                 @lists = @lists.search(params[:q])
                end

		@onts = Ont.all
		@allLists = List.all
		@freeLists = []
		@doneLists = []
		@lists.each do |list|
		if list.status == 'В роботі'
		@freeLists.push(list)
		elsif list.status == 'Виконано'
		@doneLists.push(list)
		end
		end 
	
		if params[:team] || params[:status] || params[:works]
			p = {team: params[:team],
				      status: params[:status],
				      works: params[:works]	
					}
			@lists = @lists.filterItems(p)
		end
	end
	
	def new
	  @works = ['Оберіть','Підключення клієнта','Ремонт клієнта']
	  @statuses = ['Оберіть', 'В роботі']
	  @teams = ['Оберіть','grabovich@ukr.net','vladi@ukr.net','igor@ukr.net']
	end
	
	def show
		@list = List.find(params[:id])
	end

	def edit
         	@list = List.find(params[:id])
		@works = ['Оберіть','Підключення клієнта','Ремонт клієнта']
          	@statuses = ['Оберіть', 'В роботі','Виконано']
        	@teams =  ['Оберіть','grabovich@ukr.net','vladi@ukr.net','igor@ukr.net']	
	end

	def update
		@list = List.find(params[:id])
		@list.update(list_params)
		redirect_to @list
	end

	def closeWork

		@routers = current_user.routers

		def get_all_routers_model               #Создает сет с моделями роутеров
			@routers_model = []
			@routers.each do |router|
				@routers_model.push(router[:model])
			end
			@routers_model = @routers_model.to_set
		end

		def get_all_routers_name                #Создает сет с брендами роутеров
			@routers_name = []
			@routers.each do |router|
				@routers_name.push(router[:name])
			end
			@routers_name = @routers_name.to_set
		end

		get_all_routers_name()
		get_all_routers_model()

		if params[:id]!=nil
		  @list = List.find(params[:id])
			@allList = List.all
			@ont = Ont.all
			if @list.works == "Підключення клієнта"
				@ont.closeWork(@list.team)
				@allList.changeStatusWork(@list)
			elsif
			@allList.changeStatusWork(@list)
			end
		else
			if params[:name]!=nil&&params[:model]!=nil&&params[:count]!=nil&&params[:info_about_router]!=nil
				Router.close_work_with_router(current_user,params[:name],params[:model],params[:count])
				@useRouter = UsedRouter.new(name: params[:name], model: params[:model], count: params[:count], info_about_router: params[:info_about_router], description: params[:description], time: Time.now.strftime("%d.%m.%Y"))
				@useRouter.save
				redirect_to lists_path
			end
		end


	end

	def destroy
		@list = List.find(params[:id])
		@list.destroy
		redirect_to lists_path
	end	

	def create
		@list = List.new(list_params)
		@list.save
		redirect_to @list
	end

	private def  list_params
		params.require(:list).permit(:tel,:adress,:works,:status,:team,:descr,:date).merge(date: Time.now.strftime("%d.%m.%Y"))
	end
end
