records = [
  {
    user: { username: "sharky_j", avatar_url: "https://live.staticflickr.com/65535/52358606250_01c667c5da_w.jpg", email: "sharky_j@gmail.com", password: "abcd" },
    post: { photo_url: "https://live.staticflickr.com/65535/52358421508_786aa10e2c_c.jpg"}
  },
  {
    user: { username: "kirk_whalum", avatar_url: "https://live.staticflickr.com/65535/52358421348_f34c7996b1.jpg", email: "kirk_w@gmail.com", password: "abcd" },
    post: { photo_url: "https://live.staticflickr.com/65535/52357237337_1cc718f6a7_4k.jpg"}
  },
  {
    user: { username: "marlin_peppa", avatar_url: "https://live.staticflickr.com/65535/52358415933_0a0e6bc35f_3k.jpg", email: "marlin_p@gmail.com", password: "abcd" },
    post: { photo_url: "https://live.staticflickr.com/65535/52358494794_f88b160d15_4k.jpg"}
  }
]

puts "=== Seeding database... ==="

# create Users and FinstagramPosts
records.each do |record|
  # Create a User
  user = User.create record[:user]
  puts "-- Created User: #{user.username}"

  # Create a FinstagramPost
  finstagram_post = record[:post]
  finstagram_post[:user_id] = user.id
  FinstagramPost.create finstagram_post
  puts "-- Created a FinstagramPost for User: #{user.username}"
end

puts "=== Seeding complete. ==="
