class ColumnsController < ApplicationController
  layout 'tables_layout'
  before_action :authenticate_user!

  def index
    @columns = Column.all
  end

  def new
    @tables = Table.all
    @column = Column.new
  end

  def create
    @tables = Table.all
    @column = Column.new(column_params)
    if @column.save
      redirect_to @column
    else
      render :new
    end
  end

  def edit
    @tables = Table.all
    @column = Column.find(params[:id])
  end

  def update
    @tables = Table.all
    @column = Column.find(params[:id])
    if @column.update(column_params)
      redirect_to @column
    else
      render :edit
    end
  end

  def show
    @column = Column.find(params[:id])
  end

  def destroy
    @column = Column.find(params[:id])
    @column.destroy
    redirect_to columns_path
  end

  private

  def column_params
    params.require(:column).permit(:name, :table_id)
  end
end
