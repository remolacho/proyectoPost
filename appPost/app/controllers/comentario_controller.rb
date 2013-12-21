class ComentarioController < ApplicationController
  def index
  end

  def show
  	@post = Post.find(params[:id])
  	@comentario = Comentario.where(:post_id => params[:id]).paginate(:page => params[:page], :per_page => 3)
    @coment = Comentario.new
  end

  def create

   	@comentario= Comentario.new(params[:coment])

    if @comentario.save
       redirect_to :action => :show, :id => @comentario.post_id
    else
      flash.now.alert = "Problemas al Registrar el Comentario"
      render "new"
    end

  end

end
