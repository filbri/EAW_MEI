class Mensagen < ActiveRecord::Base
	belongs_to :destino, class_name: 'User', foreign_key: 'destinatario'
	belongs_to :origem, class_name: 'User', foreign_key: 'remetente'
end
