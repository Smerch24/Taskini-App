class TablesController < ApplicationController
  def index
    @tables = Table.all
  end

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(table_params)
    if @table.save
      redirect_to @table
    else
      render :new
    end
  end

  def edit
    @table = Table.find(params[:id])
  end

  def update
    @table = Table.find(params[:id])
    if @table.update(table_params)
      redirect_to @table
    else
      render :edit
    end
  end

  def show
    @table = Table.find(params[:id])
  end

  def destroy
    @table = Table.find(params[:id])
    @table.destroy
    render :index
  end

  def table_params
    params.require(:tables).permit(:name, :user_id)
  end
end
