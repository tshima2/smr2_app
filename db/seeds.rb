# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create User
_name = Faker::Name.name ; _email= "system@smoothrunning.com"; _pass="system"; _guest = false; _keep_team_id=1
user_sys=User.create!(name: _name, email: _email, password: _pass, guest: _guest, keep_team_id: _keep_team_id)
_name = Faker::Name.name ; _email= "user01@smoothrunning.com"; _pass="user01"; _guest = false; _keep_team_id=2
user_01=User.create!(name: _name, email: _email, password: _pass, guest: _guest, keep_team_id: _keep_team_id)
_name = Faker::Name.name ; _email= "user02@smoothrunning.com"; _pass="user02"; _guest = false; _keep_team_id=1
user_02=User.create!(name: _name, email: _email, password: _pass, guest: _guest, keep_team_id: _keep_team_id)
_name = Faker::Name.name ; _email= "user03@smoothrunning.com"; _pass="__guest__"; _guest = true; _keep_team_id=1
user_03=User.create!(name: _name, email: _email, password: _pass, guest: _guest, keep_team_id: _keep_team_id)
_name = Faker::Name.name ; _email= "guest@smoothrunning.com"; _pass="__guest__"; _guest = true; _keep_team_id=1
user_guest=User.create!(name: _name, email: _email, password: _pass, guest: _guest, keep_team_id: _keep_team_id)

# create Team
_name = "DefaultGroup"
team_01=Team.create!(name: _name, owner_id: user_sys.id)
_name = "User01Group"
team_02=Team.create!(name: _name, owner_id: user_01.id)

# create Assign
Assign.create!(user_id: user_sys.id, team_id: team_01.id)
Assign.create!(user_id: user_01.id, team_id: team_01.id)
Assign.create!(user_id: user_02.id, team_id: team_01.id)
Assign.create!(user_id: user_03.id, team_id: team_01.id)
Assign.create!(user_id: user_guest.id, team_id: team_01.id)
Assign.create!(user_id: user_01.id, team_id: team_02.id)
Assign.create!(user_id: user_02.id, team_id: team_02.id)

# Geometry型に緯度経度を設定するためのPointクラス
class Point
    def self.from_x_y(x, y)
        x.present? && y.present? ? "POINT(#{x} #{y})" : nil
    end
end

site = Site.new
site.user_id = user_01.id
site.team_id = team_01.id
site.title = '東京駅'
site.address = '中央区'
site.geom = Point.from_x_y( 139.767125, 35.681236 )
site.description = Faker::Lorem.sentence
site.save!

site = Site.new
site.user_id = user_01.id
site.team_id = team_01.id
site.title = '三鷹駅'
site.address = '三鷹市'
site.geom = Point.from_x_y( 139.560978, 35.702727 )
site.description = Faker::Lorem.sentence
site.save!

site = Site.new
site.user_id = user_01.id
site.team_id = team_01.id
site.title = '立川駅'
site.address = '立川市'
site.geom = Point.from_x_y( 139.413671, 35.69817 )
site.description = Faker::Lorem.sentence
site.save!

site = Site.new
site.user_id = user_01.id
site.team_id = team_01.id
site.title = '八王子駅'
site.address = '八王子市'
site.geom = Point.from_x_y( 139.339921, 35.65537 )
site.description = Faker::Lorem.sentence
site01 = site.save!

site = Site.new
site.user_id = user_02.id
site.team_id = team_01.id
site.title = '名古屋駅'
site.address = '名古屋市'
site.geom = Point.from_x_y( 136.8814335, 35.17089362 )
site.description = Faker::Lorem.sentence
site02 = site.save!

site = Site.new
site.user_id = user_02.id
site.team_id = team_01.id
site.title = '福岡駅'
site.address = '福岡市'
site.geom = Point.from_x_y( 130.42043374,  33.58985702)
site.description = Faker::Lorem.sentence
site.save!

site01 = Site.new
site01.user_id = user_01.id
site01.team_id = team_02.id
site01.title = '富士山'
site01.address = '御殿場市'
site01.geom = Point.from_x_y( 138.72734785,  35.36063614)
site01.description = <<EOS
Mt. Fuji (Mt. Fuji, (English: Mount Fuji) is an activity that straddles Yamanashi Prefecture (Fujiyoshida City, Narusawa Village, Nantodome County) and Shizuoka Prefecture (Fujinomiya City, Fuji City, Susono City, Gotemba City, Oyama Town, Shunto County). It is a volcano [Note 3]. At an altitude of 3767.12 meters, it is an independent peak of Japan's highest peak (Kengamine) [Note 4], and its graceful appearance is widely known as a symbol of Japan outside Japan. It is a subject and has a great influence on society not only in terms of art but also in terms of geology such as climate and geological formation. It reaches.
It is said to be a sacred mountain from ancient times, and especially the top of the mountain was considered sacred because it was said that Asama Omikami was enshrined. The Asama Shrine was enshrined by the Ritsuryo nation to calm the eruption, and the Asama worship was established. In addition, it was recognized as a sacred place for Shugendo by the founder of Mt. Fuji Shugendo, and worshipers began to worship. These Fuji worships have diversified with the times, leading to the formation of groups such as Murayama Shugen and Fujiko. Currently, there are many tourist attractions around the foot of Mt. Fuji, and Mt. Fuji is popular during the summer season.
It has been selected as one of Japan's Three Holy Mountains (Three Holy Mountains), Japan's 100 Famous Mountains [3], and Japan's Top 100 Geological Sites. In 1936 (Showa 11), it was designated as Fuji Hakone Izu National Park [Note 5]. After that, in 1952 (Heisei 27), a special scenic spot, in 2011 (Heisei 23), a historic site, and on June 22, 2013 (Heisei 25), along with related cultural assets, "Mt. Fuji-the object of worship" It was registered as a World Cultural Heritage site under the name of "The Source of Art" [5]. 
EOS
site01.save!

site02 = Site.new
site02.user_id = user_02.id
site02.team_id = team_02.id
site02.title = '剱岳'
site02.address = '中部山岳国立公園内'
site02.geom = Point.from_x_y( 137.61732101,  36.62351875)
site02.description = Faker::Lorem.sentence
site02.save!

require "csv"
comments_header=[
    "男性トイレ総数","男性トイレ数（小便器）","男性トイレ数（和式）","男性トイレ数（洋式）","女性トイレ総数",
    "女性トイレ数（和式）","女性トイレ数（洋式）","男女共用トイレ総数","男女共用トイレ数（和式）","男女共用トイレ数（洋式）",
    "多機能トイレ","車椅子使用者用トイレ有無","乳幼児用設備設置トイレ有無","オストメイト設置トイレ有無","利用開始時間",
    "利用終了時間","利用可能時間特記事項","画像","画像_ライセンス","URL"]
CSV.foreach('db/131130_public_toilet.csv', headers: true) do |row|
  _user = User.find(rand(user_01.id..user_03.id))
  _site = _user.sites.build(team_id: team_01.id, 
                                title: row["名称"], 
                                address: row["住所"], 
                                #description: row["URL"],
                                description: Faker::Lorem.paragraph,
                                geom: Point.from_x_y(row["経度"], row["緯度"])
  )
  _site.save!
end

# create ImagePost
team_01.sites.each do |site|
    ImagePost.create!(
        image: File.open("#{Rails.root.to_s}/public/images_for_seed/#{rand(1..7)}.jpg"), 
        user_id: rand(user_01.id..user_03.id), 
        site_id: site.id
    )
end

ImagePost.create!(image: File.open("#{Rails.root.to_s}/public/images_for_seed/#{rand(1..6)}.png"), user_id: user_01.id, site_id: team_02.sites.first.id)
ImagePost.create!(image: File.open("#{Rails.root.to_s}/public/images_for_seed/#{rand(1..6)}.png"), user_id: user_02.id, site_id: team_02.sites.second.id)
ImagePost.create!(image: File.open("#{Rails.root.to_s}/public/images_for_seed/#{rand(1..6)}.png"), user_id: user_01.id, site_id: team_02.sites.first.id)
ImagePost.create!(image: File.open("#{Rails.root.to_s}/public/images_for_seed/#{rand(1..6)}.png"), user_id: user_02.id, site_id: team_02.sites.second.id)
