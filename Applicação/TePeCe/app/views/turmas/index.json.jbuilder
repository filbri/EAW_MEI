json.array!(@turmas) do |turma|
  json.extract! turma, :id, :designacao
  json.url turma_url(turma, format: :json)
end
