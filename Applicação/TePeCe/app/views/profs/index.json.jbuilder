json.array!(@profs) do |prof|
  json.extract! prof, :id, :nome, :dataNasc, :nBI, :morada, :cp, :localidade, :email, :user_id
  json.url prof_url(prof, format: :json)
end
