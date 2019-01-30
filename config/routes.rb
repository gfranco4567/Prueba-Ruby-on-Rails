Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




  get 'todos', to: 'todos#index'
  get 'todos/new', as: 'new_todo'
  post 'todos', to: 'todos#create'
  get 'todos/:id', to: 'todos#show'
  get 'todos/:id/edit', to: 'todos#edit', as: 'edit_todo'
  put 'todos/:id', to: 'todos#update'
  patch 'todos/:id', to: 'todos#update'
  delete 'todos/:id', to: 'todos#destroy'

  patch 'todos/:id/set_complete', to: 'todos#set_complete', as:'set_complete'
  get 'todos/list', as: 'todos_list'

  root 'todos#index'
end
