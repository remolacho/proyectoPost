class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
		t.string :cedula              
		t.string :nombre              
		t.string :apellido            
		t.string :correo              
		t.string :password_digest           
		t.string :pais                
		t.string :ciudad              
		t.string :profesion           
		t.integer :estatus            
		t.references :privilegio      
      	t.timestamps
    end
  end
end
