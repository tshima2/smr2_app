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
_name = Faker::Name.name ; _email= "user01@smoothrunning.com"; _pass="user01"; _guest = false; _keep_team_id=1
user_01=User.create!(name: _name, email: _email, password: _pass, guest: _guest, keep_team_id: _keep_team_id)
_name = Faker::Name.name ; _email= "user02@smoothrunning.com"; _pass="user02"; _guest = false; _keep_team_id=1
user_02=User.create!(name: _name, email: _email, password: _pass, guest: _guest, keep_team_id: _keep_team_id)
_name = Faker::Name.name ; _email= "guest@smoothrunning.com"; _pass="__guest__"; _guest = true; _keep_team_id=1
user_guest=User.create!(name: _name, email: _email, password: _pass, guest: _guest, keep_team_id: _keep_team_id)

# create Team
_name = "DefaultGroup"
team_01=Team.create!(name: _name, owner_id: user_sys.id)

# create Assign
Assign.create!(user_id: user_sys.id, team_id: team_01.id)
Assign.create!(user_id: user_01.id, team_id: team_01.id)
Assign.create!(user_id: user_02.id, team_id: team_01.id)
Assign.create!(user_id: user_guest.id, team_id: team_01.id)

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
site.save!

site = Site.new
site.user_id = user_01.id
site.team_id = team_01.id
site.title = '名古屋駅'
site.address = '名古屋市'
site.geom = Point.from_x_y( 136.8814335, 35.17089362 )
site.description = Faker::Lorem.sentence
site.save!

site = Site.new
site.user_id = user_02.id
site.team_id = team_01.id
site.title = '富士山'
site.address = '御殿場市'
site.geom = Point.from_x_y( 138.72734785,  35.36063614)
site.description = Faker::Lorem.sentence
site.save!
