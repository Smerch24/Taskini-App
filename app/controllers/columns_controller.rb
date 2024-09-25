class ColumnsController < ApplicationController
  before_action :authenticate_user!

  def index
    @columns = Column.all
  end

  def new
    @column = Column.new
  end

  def create
    @column = Column.new(column_params)
    if @column.save
      redirect_to @column
    else
      render :new
    end
  end

  def edit
    @column = Column.find(params[:id])
  end

  def update
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

  def column_params
    params.require(:column).permit(:name, :table_id)
  end
end
