class CreateExercicios < ActiveRecord::Migration
  def change
    create_table :exercicios do |t|
      t.string :titulo
      t.string :enunciado
      t.integer :aluno_id

      t.timestamps
    end
  end
end
