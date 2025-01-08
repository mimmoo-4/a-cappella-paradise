# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   member = Member.find_or_create_by!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#ジャンル
one = Genre.find_or_create_by!(name: "ジャンル１") do |genre|
end

two = Genre.find_or_create_by!(name: "ジャンル２") do |genre|
end

three = Genre.find_or_create_by!(name: "ジャンル３") do |genre|
end
#会員
olivia = Member.find_or_create_by!(email: "olivia@example.com") do |member|
  member.name = "Olivia"
  member.furigana = "おりびあ"
  member.nickname = "オビ"
  member.password = "password"
  member.address = "東京都千代田区"
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kkrn_icon_user_1.png"), filename:"sample-member1.jpg")
end

james = Member.find_or_create_by!(email: "james@example.com") do |member|
  member.name = "James"
  member.furigana = "ジェームス"
  member.nickname = "J"
  member.password = "password"
  member.address = "東京都台東区"
  member.self_introduction = "よろしく"
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kkrn_icon_user_2.png"), filename:"sample-member2.jpg")
end

lucas = Member.find_or_create_by!(email: "lucas@example.com") do |member|
  member.name = "Lucas"
  member.furigana = "ルーカス"
  member.nickname = "カス"
  member.password = "password"
  member.address = "東京都港区"
  member.main_part = "リード"
  member.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kkrn_icon_user_3.png"), filename:"sample-member3.jpg")
end
#投稿
Post.find_or_create_by!(post_title: "メンバー募集中！") do |post|
  post.post_text = "バンドを組むため、４名メンバーを募集します。"
  post.member = olivia
  post.genre = one
end

Post.find_or_create_by!(post_title: "基礎練習方法") do |post|
  post.post_text = "アカペラを始めるなら、まずこれをやりましょう。"
  post.member = james
  post.genre = two
end

Post.find_or_create_by!(post_title: "〇〇で歌います！") do |post|
  post.post_text = "来週金曜日、〇〇で歌うことになりました。"
  post.member = lucas
  post.genre = three
end
