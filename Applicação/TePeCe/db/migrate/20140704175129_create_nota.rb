class CreateNota < ActiveRecord::Migration
  def change
    create_table :nota do |t|
      t.integer :aluno_id
      t.integer :exercicio_id
      t.integer :valor

      t.timestamps
    end
  end
end
