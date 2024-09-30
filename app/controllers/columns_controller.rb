class ColumnsController < ApplicationController
  layout 'tables_layout'
  before_action :authenticate_user!

  def index
    @columns = Column.all
  end

  def new
    @tables = current_user.tables
    @column = Column.new
  end

  def create
    @tables = Table.all
    @column = Column.new(column_params)
    if @column.save
      redirect_to tables_path
    else
      render :new
    end
  end

  def edit
    @tables = current_user.tables
    @column = Column.find(params[:id])
  end

  def update
    @tables = Table.all
    @column = Column.find(params[:id])
    if @column.update(column_params)
      redirect_to tables_path
    else
      render :edit
    end
  end

  def show
    @column = Column.find(params[:id])
  end

  def destroy
    @column = Column.find(params[:id])
    Rails.logger.debug "Deleting column: #{@column.inspect}"
    @column.destroy
    redirect_to tables_path, notice: 'Column was successfully deleted.'
  end

  private

  def column_params
    params.require(:column).permit(:name, :table_id)
  end
end
