class CreateTurmas < ActiveRecord::Migration
  def change
    create_table :turmas do |t|
      t.string :designacao
      t.integer :aluno_id

      t.timestamps
    end
  end
end
