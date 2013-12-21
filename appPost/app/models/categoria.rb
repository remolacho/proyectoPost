class Categoria < ActiveRecord::Base
	has_many :post
end
