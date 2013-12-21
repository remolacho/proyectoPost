class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
		t.references :post
		t.references :usuario
		t.text :texto
		t.date :fecha_creacion
		t.integer :estatus
      	t.timestamps
    end
  end
end
