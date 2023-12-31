class TasksController < ApplicationController

  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
  end


  def update
    @task = Task.find(params[:id])
      if @task.update(task_params)
        redirect_to @task
      else
        render 'edit'
      end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

end

  private

def task_params
  params.require(:task).permit(:title, :details, :completed)
end

def find_task
  @task = Task.find(params[:id])
end
