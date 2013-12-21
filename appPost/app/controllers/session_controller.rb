class SessionController < ApplicationController
  def new
  end

  def create  
    user = Usuario.find_by_correo(params[:correo])
    if user && user.authenticate(params[:password])
      if user.estatus == 1    
        session[:user_id] = user.id
        redirect_to root_url, :notice => "Logged in!"
      else
        flash.now.alert = "Usuario Suspendido para 
                          activar su cuenta enviar un mail 
                          a jonathang_25@hotmail.con con tu e-mail de la cuenta"
        render "new"
      end
    else
      flash.now.alert = "Problemas al Iniciar Session Verificar Mail o el Password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
