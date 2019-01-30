class TodosController < ApplicationController
# --
before_action :set_todo, only: %i[show edit update destroy]

  def index
    @todos = Todo.order(:id)
    @todo = Todo.new
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    redirect_to root_path
  end

  def show; end

  def edit; end

  def update
    if @todo.update(todo_params)
      redirect_to root_path, notice: 'El ToDo fue actualizado!!'
    else
      redirect_to root_path, alert: 'Ha ocurrido un error. Por favor intenta nuevamente..'
    end
  end

  def destroy
    @todo.destroy
    redirect_to root_path, notice: 'El ToDo fue eliminado!'
  end

  def set_complete
    @todo = Todo.find(params[:id])
    @todo.complete = true
    @todo.save
    redirect_to root_path, notice: 'El ToDo ha sido completado!!'
    end

def completed
@todos = Todo.where(complete: true)
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end


# --
end
