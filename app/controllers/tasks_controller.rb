class TasksController < ApplicationController
  layout 'tables_layout'
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    @columns = Column.all
  end

  def create
    @columns = Column.all
    @task = Task.new(task_params)
    if @task.save
      redirect_to tables_path
    else
      render :new
    end
  end

  def edit
    @columns = Column.all
    @task = Task.find(params[:id])
  end

  def update
    @columns = Column.all
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :column_id)
  end
end
