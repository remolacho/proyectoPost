class PrivilegioController < ApplicationController
  def new
  	@privilegio = Privilegio.new
  end

  def create
  	@privilegio = Privilegio.new(params[:privilegio])
    if @privilegio.save
      flash.now.alert = "privilegio Almacenado"
      render "new"
    else
      flash.now.alert = "Problemas al Guardar el privilegio"
      render "new"
    end

  end
end
