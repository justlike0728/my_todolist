class TodolistsController < ApplicationController

	def index
		@todolists = Todolist.all
	end
end
