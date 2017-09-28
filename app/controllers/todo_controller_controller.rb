require 'json'

class TodoControllerController < ApplicationController
  def index
  	@projs = Project.all
    respond_to do |format|
      format.html # index.html.erb
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
      #string = '{"name":"Иван","name2":" Иван"}'
      projects = Project.all.map{|proj| [proj.id, proj.title, proj.todos]}
      projects = projects.to_json
      render json: projects#projects.to_json#projects.to_json#JSON.parse(string)1
  end
end
