class Api::V1::TodosController < ApplicationController
  def index
    render json: { status: 200, todos: Todo.all }
  end

  def create
    todo = Todo.new(todo_params)

    if todo.save
      render json: { status: 200, todo: todo }
    else
      render json: { status: 500, message: "Todo not saved"}
    end
  end

  def destroy
    todo = TOdo.find(params[:id])

    if todo.destroy
      render json: { status: 200, todo: todo }
    else
      render json: { status: 500, message: "Todo not deleted"}
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end
