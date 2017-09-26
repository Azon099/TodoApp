Rails.application.routes.draw do
  root to: 'todo_controller#index'

  get 'todo_controller/index'

  get 'todo_controller/newTodo'
  post 'todo_controller/newTodo'

  get 'todo_controller/updateTodos'
  post 'todo_controller/updateTodos'

  get 'todo_controller/createTodo'
  post 'todo_controller/createTodo'

  #get 'todo_controller/createTodo' to: 'todo_controller#createTodo'
 # post 'todo_controller/createTodo' to: 'todo_controller#createTodo'

	#get '/todo_controller/:Todo', to: 'todo_controller#createTodo', as: 'todo'

	#match 'todos', to: 'todo_controller#createTodo', via: [:post]
  #resources :projects
  resources :todos, controller: 'todo_controller'
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
