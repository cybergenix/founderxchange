json.array!(@postings) do |posting|
  json.extract! posting, :id, :job_type, :title, :compensation, :pitch
  json.url posting_url(posting, format: :json)
end
