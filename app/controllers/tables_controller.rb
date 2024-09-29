class TablesController < ApplicationController
  layout 'tables_layout'
  before_action :authenticate_user!

  def index
    @tasks = Task.all
    @columns = Column.all
    @tables = Table.all
  end

  def new
    @tables = Table.all
    @table = Table.new
  end

  def create
    @tables = Table.all
    @table = Table.new(table_params)
    if @table.save
      redirect_to @table
    else
      render :new
    end
  end

  def edit
    @tables = Table.all
    @table = Table.find(params[:id])
  end

  def update
    @tables = Table.all
    @table = Table.find(params[:id])
    if @table.update(table_params)
      redirect_to @table
    else
      render :edit
    end
  end

  def show
    @tasks = Task.all
    @columns = Column.all
    @tables = Table.all
    @table = Table.find(params[:id])
  end

  def destroy
    @table = Table.find(params[:id])
    @table.destroy
    redirect_to tables_path
  end

  private

  def table_params
    params.require(:table).permit(:name, :user_id)
  end
end
