class AddColumn < ActiveRecord::Migration
  def change
   	add_column :exercicios, :disciplina_id, :integer
  end
end
