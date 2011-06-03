class TodosController < ApplicationController
  respond_to :html, :json

  def index
    respond_to do |format|
      format.html
      format.json { respond_with Todo.all }
    end
  end

  def show
    respond_with Todo.find(params[:id])
  end

  def create
    todo = Todo.new(params)
    if todo.save
      respond_with todo
    else
      render :json => todo.errors, :status => :unprocessable_entity
    end
  end

  def update
    todo = Todo.find(params[:id])

    if todo.update_attributes(params)
      respond_with todo
    else
      render :json => todo.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    render :json => nil
  end
end
