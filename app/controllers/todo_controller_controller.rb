class TodoControllerController < ApplicationController
  def index
  	@projs = Project.all
  end

  def newTodo
  	proj = Project.find(params[:project_id])
	todo = Todo.create text: params[:text]
  	proj.todos << todo
	redirect_to "/"
  end

  def updateTodos

  end
end
