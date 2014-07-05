json.array!(@mensagens) do |mensagen|
  json.extract! mensagen, :id, :remetente, :destinatario, :assunto, :mensagem
  json.url mensagen_url(mensagen, format: :json)
end
