class AddEncarregadoToAluno < ActiveRecord::Migration
  def change
   	add_column :alunos, :encarregado_id, :integer
  end
end
