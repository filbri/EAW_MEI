class Nota < ActiveRecord::Base
	belongs_to :exercicio
	belongs_to :aluno
end
