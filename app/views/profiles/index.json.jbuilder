json.array!(@profiles) do |profile|
  json.extract! profile, :id, :expertise, :seeking, :partner_role, :about, :experience, :prefer_age, :equity_type
  json.url profile_url(profile, format: :json)
end
