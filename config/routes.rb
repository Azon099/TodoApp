Rails.application.routes.draw do
  root to: 'todo_controller#index'

  get 'todo_controller/index'

  get 'todo_controller/newTodo'
  post 'todo_controller/newTodo'

  get 'todo_controller/updateTodos'
  post 'todo_controller/updateTodos'

  get 'todo_controller/createTodo'
  post 'todo_controller/createTodo'

  get 'todo_controller/mobileApp'
  post 'todo_controller/mobileApp'


  get 'todos/:id+:state' => 'todo_controller#updateTodos'

  #resources :projects
  resources :todos, controller: 'todo_controller'
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end