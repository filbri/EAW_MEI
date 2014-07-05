json.array!(@encarregados) do |encarregado|
  json.extract! encarregado, :id, :nome, :dataNasc, :nBI, :morada, :cp, :localidade, :email, :user_id
  json.url encarregado_url(encarregado, format: :json)
end
