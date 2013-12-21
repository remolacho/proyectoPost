class Usuario < ActiveRecord::Base
	attr_accessible :cedula,:nombre,:apellido,:correo,:password,:password_confirmation,:pais,:ciudad,:profesion,:estatus,:privilegio_id 
	has_secure_password
	validates_presence_of :password, :on => :create

	belongs_to :privilegio
    has_many :post
    has_many :comentario
	
	validates :cedula, :presence => true 
    validates :nombre, :presence => true 
    validates :apellido, :presence => true 
    validates :correo, :presence => true 

end
