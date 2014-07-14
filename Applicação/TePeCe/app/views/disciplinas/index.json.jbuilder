json.array!(@disciplinas) do |disciplina|
  json.extract! disciplina, :id
  json.url disciplina_url(disciplina, format: :json)
end
