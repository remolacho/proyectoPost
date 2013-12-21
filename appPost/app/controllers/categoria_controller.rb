class CategoriaController < ApplicationController
  def new
  	@categoria = Categoria.new
  end

 def index
    @categoria = Categoria.all
  end

  def create
  	@categoria = Categoria.new(params[:categoria])
    if @categoria.save
      flash.now.alert = "Categoria Almacenado"
      render "new"
    else
      flash.now.alert = "Problemas al Guardar la categoria"
      render "new"
    end

  end

  def edit 
    if current_user == params[:id]
      @categoria = Categoria.find(params[:id])
    else
      @categoria = Categoria.find(current_user)
    end   
  end

  def update

     @categoria = Categoria.find(params[:id])
     if @categoria.update_attributes(params[:categoria])
       redirect_to :action => :index
     else
       flash.now.alert = "Problemas al Editar la categoria"
       render 'edit'
     end

  end

end
