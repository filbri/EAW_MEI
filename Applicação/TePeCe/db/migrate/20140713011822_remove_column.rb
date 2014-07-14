class RemoveColumn < ActiveRecord::Migration
  def down
   	remove_column :turmas, :aluno_id
  end
end
