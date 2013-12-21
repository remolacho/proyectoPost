class PostController < ApplicationController
  
  respond_to :html, :js
  
  def new
  	@post  = Post.new
    @categoria = Categoria.all
  end

  def create

    @post= Post.new(params[:post])

    if @post.save
       redirect_to :action => :show, :id => @post.usuario_id
    else
      flash.now.alert = "Problemas al Registrar el Post"
      render "new"
    end

  end

  def show
    if current_user == params[:id]
      @post = Post.where(:usuario_id => params[:id])
    else
      @post = Post.where(:usuario_id =>current_user)
    end
  end

  def index
    @post  = Post.where(:estatus => 1)
  end

  def estado
     
     @post = Post.find(params[:id])
     estatus = 1
     
     if @post.estatus == 1
           estatus = 0
     end  

     if @post.update_attributes(:estatus => estatus)
       redirect_to :action => :show, :id => @post.usuario_id
     else
       redirect_to :action => :show, :id => @post.usuario_id
       flash.now.alert = "Problemas al Editar el Usuario"
     end

  end

  def edit
    @post = Post.find(params[:id])
    @categoria = Categoria.all
  end
 
   def update

     @post = Post.find(params[:id])
     if @post.update_attributes(params[:post])
       redirect_to :action => :show, :id => @post.usuario_id
     else
       flash.now.alert = "Problemas al Editar el Usuario"
       render 'edit'
     end

  end

end
