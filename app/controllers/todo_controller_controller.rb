class TodoControllerController < ApplicationController
  def index
  	@projs = Project.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projs }
    end
  end

  def newTodo
  	proj = Project.find(params[:project_id])
	todo = Todo.create text: params[:text]
  	proj.todos << todo
	redirect_to "/"
  end

  def updateTodos
    todo = Todo.find(params[:id])
    todo.isCompleted = params[:state]
    todo.save
    redirect_to "/"
  end

  def mobileApp
      string = '{
        "name":"Иван",
        "name2":" Иван"}'
    render json: JSON.parse(string)
  end
end
