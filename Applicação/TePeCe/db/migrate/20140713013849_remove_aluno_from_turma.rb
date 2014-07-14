class RemoveAlunoFromTurma < ActiveRecord::Migration
  def change
   	remove_column :turmas, :aluno_id
  end
end
