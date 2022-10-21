def humanized_time_ago(minute_num)
  if minute_num >= 60
    "#{minute_num / 60} hours ago"
  else
    "#{minute_num} minutes ago"
  end
end

get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)

  erb(:index)
end
