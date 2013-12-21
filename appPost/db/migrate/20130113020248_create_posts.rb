class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
		    t.references :usuario
		    t.references :categoria
		    t.string :titulo
		    t.date   :fecha_creacion
		    t.text :texto
        t.integer :estatus
        t.timestamps
    end
  end
end
