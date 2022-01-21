class TodolistsController < ApplicationController
  
  def new
    @list = List.new
  end
  
  def create
    list = List.new(list_params)
    list.save
    redirect_to "/todolists/#{list.id}"
  end
  
  def index
    @lists = List.all
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
  
end
