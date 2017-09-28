Rails.application.routes.draw do
  root to: 'todo_controller#index'

  get 'todo_controller/index'

  get 'todo_controller/newTodo'
  post 'todo_controller/newTodo'

  get 'todo_controller/updateTodos'
  post 'todo_controller/updateTodos'

  get 'todo_controller/createTodo'
  post 'todo_controller/createTodo'

  get 'todo_controller/mobileAppGet'
  post 'todo_controller/mobileAppGet'


  get 'todos/:id+:state' => 'todo_controller#updateTodos'
  get 'todos/add/:project_id|:text' => 'todo_controller#mobileAppSet'

  #resources :projects
  resources :todos, controller: 'todo_controller'
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end