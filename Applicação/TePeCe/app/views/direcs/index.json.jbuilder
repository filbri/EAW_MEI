json.array!(@direcs) do |direc|
  json.extract! direc, :id, :nome, :dataNasc, :nBI, :morada, :cp, :localidade, :email, :user_id
  json.url direc_url(direc, format: :json)
end
