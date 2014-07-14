class AddTurmaColumn < ActiveRecord::Migration
  def change
   	add_column :alunos, :turma_id, :integer
  end
end
