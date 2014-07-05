class CreateMensagens < ActiveRecord::Migration
  def change
    create_table :mensagens do |t|
      t.string :remetente
      t.string :destinatario
      t.string :assunto
      t.string :mensagem

      t.timestamps
    end
  end
end
