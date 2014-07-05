json.array!(@alunos) do |aluno|
  json.extract! aluno, :id, :nome, :dataNasc, :nBI, :morada, :cp, :localidade, :email, :user_id
  json.url aluno_url(aluno, format: :json)
end
