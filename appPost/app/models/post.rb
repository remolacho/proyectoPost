class Post < ActiveRecord::Base
	belongs_to :categoria
	belongs_to :usuario
	has_many   :comentario
end
