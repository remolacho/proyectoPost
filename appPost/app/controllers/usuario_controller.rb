class UsuarioController < ApplicationController
  def new
  	@usuario = Usuario.new
  	@privilegio = Privilegio.all
  end

  def create
    @usuario = Usuario.new(params[:usuario])
    if @usuario.save
      flash.now.alert = "Usuario Almacenado ya Puede Iniciar Session"
      render "new"
    else
      flash.now.alert = "Problemas al Registrar el Usuario"
      render "new"
    end
  end

  def index
    @usuario = Usuario.all
  end

  def show
     if current_user == params[:id]
      @usuario = Usuario.find(params[:id])
    else
      @usuario = Usuario.find(current_user)
    end
  end

  def edit
    if current_user == params[:id]
      @usuario = Usuario.find(params[:id])
    else
      @usuario = Usuario.find(current_user)
    end
  end

  def update

     @usuario = Usuario.find(params[:id])
     if @usuario.update_attributes(params[:usuario])
       redirect_to :action => :show, :id => @usuario.id
     else
       flash.now.alert = "Problemas al Editar el Usuario"
       render 'edit'
     end

  end

end
