class TodosController < ApplicationController

  def index
    @todo = Todo.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @todo = Todo.new
  end

  # GET /projects/1/edit
  def edit
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    redirect_to projects_url
  end

  def update
    respond_to do |format|
      if @todo.update(project_params)
        format.html { redirect_to @todo, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  	def set_project
      @todo = Todo.find(params[:id])
    end
    def todo_params
      params.require(:todo).permit(:text, :isCompleted, :project_id)
    end
end
