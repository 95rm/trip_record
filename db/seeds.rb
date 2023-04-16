# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者のログイン情報
Admin.create!(
 email: 'admin@admin',
 password: '000000'
)

User.create!(
 [
  {email: 'taro@example.com', account_name: 'taro.0925', password: 'password'},
  {email: 'sato@example.com', account_name: 'sato.0208', password: 'password'},
 ]
)

user = User.first
user2 = User.last
TripPlan.create!(
 [
  {title_name: '京都旅行', first_day: '2023-05-01', second_day: '2023-05-03', number_day: '3', budget: '100000', user_id: user.id},
  {title_name: '北海道グルメ旅', first_day: '2023-07-15', second_day: '2023-07-18', number_day: '4', budget: '150000', user_id: user2.id},
  {title_name: '夏の沖縄旅行', first_day: '2023-09-01', second_day: '2023-09-05', number_day: '5', budget: '300000', user_id: user2.id},
 ]
 )

trip_plan1 = TripPlan.first
trip_plan2 = TripPlan.second
trip_plan3 = TripPlan.last
TripPlanDetail.create!(
 [
 {hour: '09:30', category: '移動', what_day: '1', destination: '東京駅(新幹線)', price: '15200', trip_plan_id: trip_plan1.id},
 {hour: '12:00', category: '遊び', what_day: '1', destination: '清水寺', price: '3000',  trip_plan_id: trip_plan1.id},
 {hour: '13:00', category: '食事', what_day: '1', destination: 'お昼（茶そば）', price: '2000', trip_plan_id: trip_plan1.id},
 {hour: '15:00', category: '遊び', what_day: '1', destination: '金閣寺', price: '3000', trip_plan_id: trip_plan1.id},
 {hour: '17:30', category: 'ホテル', what_day: '1', destination: '京都ホテルチェックイン', price: '30000', trip_plan_id: trip_plan1.id},
 {hour: '19:30', category: '食事', what_day: '1', destination: '夜ご飯', price: '4000', trip_plan_id: trip_plan1.id},
 {hour: '10:00', category: '遊び', what_day: '2', destination: '嵐山', price: '5000', trip_plan_id: trip_plan1.id},
 {hour: '14:00', category: '遊び', what_day: '2', destination: '渡月橋', price: '0', trip_plan_id: trip_plan1.id},
 {hour: '15:00', category: '遊び', what_day: '2', destination: '嵐山周辺の土産屋さん', price: '10000', trip_plan_id: trip_plan1.id},
 {hour: '17:30', category: '食事', what_day: '2', destination: '夜ご飯（会席）', price: '10000', trip_plan_id: trip_plan1.id},
 {hour: '20:00', category: 'ホテル', what_day: '2', destination: 'ホテルに戻る', price: '0', trip_plan_id: trip_plan1.id},
 {hour: '12:30', category: '遊び', what_day: '3', destination: '鳳凰堂', price: '2000', trip_plan_id: trip_plan1.id},
 {hour: '13:30', category: '食事', what_day: '3', destination: 'お昼', price: '1500', trip_plan_id: trip_plan1.id},
 {hour: '15:30', category: '移動', what_day: '3', destination: '京都駅(新幹線)', price: '15200', trip_plan_id: trip_plan1.id},

 {hour: '09:30', category: '移動', what_day: '1', destination: '羽田空港離陸', price: '6000', trip_plan_id: trip_plan2.id},
 {hour: '13:00', category: '食事', what_day: '1', destination: '海鮮丼', price: '5000', trip_plan_id: trip_plan2.id},
 {hour: '14:00', category: '遊び', what_day: '1', destination: '札幌観光', price: '2000', trip_plan_id: trip_plan2.id},
 {hour: '18:00', category: '食事', what_day: '1', destination: '札幌味噌ラーメン', price: '2000', trip_plan_id: trip_plan2.id},
 {hour: '19:00', category: 'ホテル', what_day: '1', destination: 'Aホテルチェックイン', price: '30000', trip_plan_id: trip_plan2.id},
 {hour: '06:30', category: '食事', what_day: '2', destination: '北海道朝市場', price: '5000', trip_plan_id: trip_plan2.id},
 {hour: '09:00', category: '遊び', what_day: '2', destination: '富良野（ラベンダー畑）', price: '4000', trip_plan_id: trip_plan2.id},
 {hour: '12:00', category: '食事', what_day: '2', destination: 'ジンギスカン', price: '5000', trip_plan_id: trip_plan2.id},
 {hour: '14:15', category: '遊び', what_day: '2', destination: '湖', price: '0', trip_plan_id: trip_plan2.id},
 {hour: '17:00', category: 'ホテル', what_day: '2', destination: 'Bホテルチェックイン', price: '40000', trip_plan_id: trip_plan2.id},
 {hour: '18:30', category: '食事', what_day: '2', destination: 'Bホテルにて夜ご飯', price: '0', trip_plan_id: trip_plan2.id},
 {hour: '07:30', category: '食事', what_day: '3', destination: '朝食', price: '1000', trip_plan_id: trip_plan2.id},
 {hour: '09:30', category: '移動', what_day: '3', destination: '旭川市内に移動', price: '0', trip_plan_id: trip_plan2.id},
 {hour: '12:00', category: '食事', what_day: '3', destination: 'お昼', price: '2000', trip_plan_id: trip_plan2.id},
 {hour: '13:00', category: '遊び', what_day: '3', destination: '動物園', price: '3000', trip_plan_id: trip_plan2.id},
 {hour: '18:00', category: 'ホテル', what_day: '3', destination: 'Cホテルチェックイン', price: '20000', trip_plan_id: trip_plan2.id},
 {hour: '19:00', category: '食事', what_day: '3', destination: 'Cホテルで夜ご飯', price: '0', trip_plan_id: trip_plan2.id},
 {hour: '06:30', category: '食事', what_day: '4', destination: 'Cホテルで朝食', price: '0', trip_plan_id: trip_plan2.id},
 {hour: '09:00', category: '移動', what_day: '4', destination: '札幌市内へ移動', price: '0', trip_plan_id: trip_plan2.id},
 {hour: '13:00', category: '食事', what_day: '4', destination: '札幌市内でお昼', price: '3000', trip_plan_id: trip_plan2.id},
 {hour: '16:15', category: '食事', what_day: '4', destination: '札幌空港離陸', price: '7000', trip_plan_id: trip_plan2.id},

 {hour: '08:20', category: '移動', what_day: '1', destination: '羽田空港離陸', price: '15000', trip_plan_id: trip_plan3.id},
 {hour: '11:30', category: '食事', what_day: '1', destination: '早めのお昼ご飯', price: '2000', trip_plan_id: trip_plan3.id},
 {hour: '13:00', category: '遊び', what_day: '1', destination: '国際通り観光', price: '10000', trip_plan_id: trip_plan3.id},
 {hour: '18:00', category: 'ホテル', what_day: '1', destination: 'Dホテルチェックイン', price: '50000', trip_plan_id: trip_plan3.id},
 {hour: '19:30', category: '食事', what_day: '1', destination: '沖縄料理屋で夜ご飯', price: '10000', trip_plan_id: trip_plan3.id},
 {hour: '08:00', category: '食事', what_day: '2', destination: 'Dホテルで朝食', price: '0', trip_plan_id: trip_plan3.id},
 {hour: '10:00', category: '遊び', what_day: '2', destination: 'シュノーケリング体験', price: '5000', trip_plan_id: trip_plan3.id},
 {hour: '12:00', category: '食事', what_day: '2', destination: 'お昼(沖縄そば)', price: '1000', trip_plan_id: trip_plan3.id},
 {hour: '13:30', category: '遊び', what_day: '2', destination: 'パラグライダー体験', price: '7000', trip_plan_id: trip_plan3.id},
 {hour: '15:00', category: 'ホテル', what_day: '2', destination: 'ホテルに戻る', price: '0', trip_plan_id: trip_plan3.id},
 {hour: '16:30', category: '食事', what_day: '2', destination: '国際通り屋台村で飲み', price: '8000', trip_plan_id: trip_plan3.id},
 {hour: '09:00', category: '食事', what_day: '3', destination: 'Dホテルで朝食', price: '0', trip_plan_id: trip_plan3.id},
 {hour: '10:30', category: '遊び', what_day: '3', destination: '首里城観光', price: '1000', trip_plan_id: trip_plan3.id},
 {hour: '12:00', category: '食事', what_day: '3', destination: 'お昼', price: '2000', trip_plan_id: trip_plan3.id},
 {hour: '13:30', category: '遊び', what_day: '3', destination: '識名園', price: '1000', trip_plan_id: trip_plan3.id},
 {hour: '15:00', category: '食事', what_day: '3', destination: '玉陵観光', price: '1000', trip_plan_id: trip_plan3.id},
 {hour: '17:00', category: '食事', what_day: '3', destination: '第一牧志公設市場で夜ご飯', price: '10000', trip_plan_id: trip_plan3.id},
 {hour: '09:00', category: '食事', what_day: '4', destination: 'Dホテルで朝食', price: '0', trip_plan_id: trip_plan3.id},
 {hour: '11:00', category: '移動', what_day: '4', destination: 'フェリーで竹富島へ', price: '8000', trip_plan_id: trip_plan3.id},
 {hour: '12:00', category: '遊び', what_day: '4', destination: '牛舎で散策', price: '5000', trip_plan_id: trip_plan3.id},
 {hour: '14:00', category: '食事', what_day: '4', destination: '遅めのお昼', price: '2000', trip_plan_id: trip_plan3.id},
 {hour: '15:30', category: '遊び', what_day: '4', destination: 'SAP体験', price: '6000', trip_plan_id: trip_plan3.id},
 {hour: '18:30', category: '移動', what_day: '4', destination: 'フェリーで沖縄本島へ', price: '8000', trip_plan_id: trip_plan3.id},
 {hour: '19:30', category: '食事', what_day: '4', destination: '沖縄の居酒屋で夜ご飯', price: '6000', trip_plan_id: trip_plan3.id},
 {hour: '09:00', category: '食事', what_day: '5', destination: 'Dホテルで朝食', price: '0', trip_plan_id: trip_plan3.id},
 {hour: '12:00', category: '遊び', what_day: '5', destination: '美ら海水族館', price: '4000', trip_plan_id: trip_plan3.id},
 {hour: '15:00', category: '遊び', what_day: '5', destination: 'お土産買う(お金は各自で決める)', price: '0', trip_plan_id: trip_plan3.id},
 {hour: '19:00', category: '食事', what_day: '5', destination: '那覇空港離陸', price: '15000', trip_plan_id: trip_plan3.id},
 ]
 )
