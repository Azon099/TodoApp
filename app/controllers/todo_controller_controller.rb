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

  def mobileAppGet
      #string = '{"name":"Иван","name2":" Иван"}'
      projects = Project.all.map{|proj| [proj.id, proj.title, proj.todos]}
      projects = projects.to_json
      jsStr = "{"
      jsStr += "\"Projects\" : ["

      Project.all.each do |proj|
        jsStr += "{\"id\" : \"#{proj.id}\",\"title\" : \"#{proj.title}\" , \"Todos\" : ["
        proj.todos.each do |todo|
          todoString = "{\"text\" : \"#{todo.text}\", \"isCompleted\" : \"#{todo.isCompleted}\", \"project_id\" : \"#{todo.project_id}\"}"
          if not todo == proj.todos.last then
            todoString += ","
          end
          jsStr += todoString
        end
        jsStr += "]}"
        if not proj == Project.last then
          jsStr += ","
        end
      end
      jsStr += "]}"
      render json: jsStr#projects.to_json#projects.to_json#JSON.parse(string)1
  end

  def mobileAppSet
    proj = Project.find(params[:project_id])
    todo = Todo.create text: params[:text]
    todo.save
    proj.todos << todo
    render json: "Pisos"
  end
end
