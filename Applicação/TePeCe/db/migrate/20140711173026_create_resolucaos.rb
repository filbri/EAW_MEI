class CreateResolucaos < ActiveRecord::Migration
  def change
    create_table :resolucaos do |t|
      t.string :resposta
      t.integer :exercicio_id

      t.timestamps
    end
  end
end
