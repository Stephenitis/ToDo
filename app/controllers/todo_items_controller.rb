class ItemsController < ApplicationController
	before_action :set_list
	before_action :set_item, except: [:create]

	def create
		# When user submits the from in /views/items/new.html.erb the @item_params get submitted.
		# @list.items.create will save your object to the database

		@item = @list.items.create(item_params)
		redirect_to(@list)
		# redirect to your List Index page or wherever you want
		# redirect_to(@list)  will direct user to /list/item/1 or some url
	end

	def destroy
		if @item.destroy
			flash[:success] = "Todo List item was deleted."
		else
			flash[:error] = "Todo List item could not be deleted."
		end
		redirect_to @list
	end

	# def complete
	# 	@item.update_attribute(:completed_at, Time.now)
	# 	redirect_to @list, notice: "Todo item completed"
	# end

	def new
		# serves /views/items/new.html.erb FORM for the user to submit
		@item = Item.new
	end

	def update

	end






	private

	def set_list
		@list = List.find(params[:list_id])
	end

	def set_item
		@item = @list.items.find(params[:id])
	end

	def item_params
		params[:item].permit(:content)
	end

end
