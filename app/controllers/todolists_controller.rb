class TodolistsController < ApplicationController
	before_action :find_todolist, only: [:edit, :update, :delete]

	def index
		@todolists = Todolist.all
	end

	def new
		@todolist = Todolist.new
	end

	def create
		@todolist = Todolist.new(todolist_params)
		if @todolist.save
			redirect_to todolists_path, notice: "新增待辦事項完成"
		else
			render new
		end
	end

	def edit

	end

	def update
		if @todolist.update(todolist_params)
			redirect_to todolists_path, notice: "更新完成"
		else
			render :edit
		end
	end

	def destroy
		@todolist = Todolist.find_by(id: params[:id])
		@todolist.destroy
		redirect_to todolists_path, notice: "待辦事項已刪除"
	end

	private
	  def find_todolist
	  	@todolist = Todolist.find_by(id: params[:id])
	  	redirect_to todolists_path, notice: "並無此待辦事項" if not @todolist
	  end

	  def todolist_params
	  	params.require(:todolist).permit(:title, :description)
	  end
end
