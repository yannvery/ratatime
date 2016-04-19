json.array!(@trackers) do |tracker|
  json.extract! tracker, :id
  json.url tracker_url(tracker, format: :json)
end
