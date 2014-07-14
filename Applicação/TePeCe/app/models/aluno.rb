class Aluno < ActiveRecord::Base
	belongs_to :user
	has_many :exercios
	has_many :notas
	belongs_to :turma
	belongs_to :encarregado
	
	
	
end
