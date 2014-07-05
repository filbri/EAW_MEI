class CreateExercicios < ActiveRecord::Migration
  def change
    create_table :exercicios do |t|
      t.string :designacao
      t.string :enunciado
      t.date :data
      t.integer :disciplina_id

      t.timestamps
    end
  end
end
