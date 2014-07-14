json.array!(@exercicios) do |exercicio|
  json.extract! exercicio, :id, :titulo, :enunciado, :aluno_id
  json.url exercicio_url(exercicio, format: :json)
end
