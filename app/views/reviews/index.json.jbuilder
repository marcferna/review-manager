json.array!(@reviews) do |review|
  json.extract! review, :id, :app_id, :uid, :title, :text, :rating, :version, :author_id
  json.url review_url(review, format: :json)
end
