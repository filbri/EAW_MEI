class Exercicio < ActiveRecord::Base
	belongs_to :aluno
	has_one :resolucao
	has_one :nota
	has_one :disciplina
	belongs_to :prof
end
