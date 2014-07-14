class ChangeColumn < ActiveRecord::Migration
  def change
   change_column :mensagens, :destinatario, :integer
   change_column :mensagens, :remetente, :integer
  end
end
