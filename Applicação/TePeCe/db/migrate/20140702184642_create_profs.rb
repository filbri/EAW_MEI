class CreateProfs < ActiveRecord::Migration
  def change
    create_table :profs do |t|
      t.string :nome
      t.date :dataNasc
      t.integer :nBI
      t.string :morada
      t.string :cp
      t.string :localidade
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
