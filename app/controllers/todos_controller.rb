class TodosController < ApplicationController

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    redirect_to projects_url
  end


  private
    def todo_params
      params.require(:todo).permit(:text, :isCompleted, :project_id)
    end
end
