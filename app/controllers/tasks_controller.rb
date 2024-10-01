class TasksController < ApplicationController
  layout 'tables_layout'
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    @column = Column.find(params[:column_id]) if params[:column_id]
    @columns = Column.where(table_id: current_user.tables.pluck(:id))
  end

  def create
    @column = Column.find(params[:task][:column_id])
    table = @column.table

    # Проверка, что текущий пользователь является владельцем таблицы
    if table.user_id == current_user.id
      @task = @column.tasks.new(task_params)

      if @task.save
        redirect_to table_path(table), notice: 'Задание успешно создано'
      else
        render :new, alert: 'Ошибка при создании задания'
      end
    else
      redirect_to tables_path, alert: 'Вы не можете создавать задания для этой таблицы.'
    end
  end

  def edit
    @task = Task.find(params[:id])
    @column = Column.find(@task.column_id)
    @table = current_user.tables.find(@column.table_id)
    @columns = @table.columns
  end

  def update
    @columns = Column.all
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tables_path
    else
      render :edit
    end
  end

  def show
    @task = Task.find(params[:id])
    @columns = current_user.tables.find(params[:id]).columns
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tables_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :column_id, :status, :priority, :deadline)
  end
end
