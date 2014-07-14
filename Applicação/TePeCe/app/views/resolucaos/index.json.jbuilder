json.array!(@resolucaos) do |resolucao|
  json.extract! resolucao, :id, :resposta, :exercicio_id
  json.url resolucao_url(resolucao, format: :json)
end
