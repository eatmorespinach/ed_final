json.array!(@listings) do |listing|
  json.extract! listing, 
  json.url listing_url(listing, format: :json)
end
