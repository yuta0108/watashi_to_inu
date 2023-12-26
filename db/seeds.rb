# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Admin.count.zero?
Admin.create!(
   email: 'watashi_to_inu@01',
   password: '111111'
)
end

if Customer.count.zero?
Customer.create!(
  last_name: '太郎',
  first_name: '令和',
  last_name_kana: 'タロウ',
  first_name_kana: 'レイワ',
  password: '111111',
  email: 'email@gmail.com',
  phone_number: '0123456789'
 )
Customer.create!(
 last_name: '太郎',
  first_name: '平成',
  last_name_kana: 'タロウ',
  first_name_kana: 'ヘイセイ',
  password: '111111',
  email: 'aaa@aaa',
  phone_number: '9876543210'
 )
 Customer.create!(
  last_name: '太郎',
  first_name: '昭和',
  last_name_kana: 'タロウ',
  first_name_kana: 'ショウワ',
  password: '111111',
  email: 'bbb@bbb',
  phone_number: '0912345678'
 )
 Customer.create!(
  last_name: '太郎',
  first_name: '大正',
  last_name_kana: 'タロウ',
  first_name_kana: 'タイショウ',
  password: '111111',
  email: 'ccc@ccc',
  phone_number: '081234567'
 )
 Customer.create!(
  last_name: '太郎',
  first_name: '明治',
  last_name_kana: 'タロウ',
  first_name_kana: 'メイジ',
  password: '111111',
  email: 'ddd@ddd',
  phone_number: '0712345678'
 )
 Customer.create!(
  last_name: '太郎',
  first_name: '江戸',
  last_name_kana: 'タロウ',
  first_name_kana: 'エド',
  password: '111111',
  email: 'eee@eee',
  phone_number: '0612345678'
 )
 Customer.create!(
  last_name: '太郎',
  first_name: '安土桃山',
  last_name_kana: 'タロウ',
  first_name_kana: 'アヅチモモヤマ',
  password: '111111',
  email: 'fff@fff',
  phone_number: '0512345678'
 )
 Customer.create!(
  last_name: '太郎',
  first_name: '戦国',
  last_name_kana: 'タロウ',
  first_name_kana: 'センゴク',
  password: '111111',
  email: 'ggg@ggg',
  phone_number: '04512345678'
 )
 Customer.create!(
  last_name: '太郎',
  first_name: '室町',
  last_name_kana: 'タロウ',
  first_name_kana: 'ムロマチ',
  password: '111111',
  email: 'hhh@hhh',
  phone_number: '0312345678'
 )
 Customer.create!(
  last_name: '太郎',
  first_name: '鎌倉',
  last_name_kana: 'タロウ',
  first_name_kana: 'カマクラ',
  password: '111111',
  email: 'iii@iii',
  phone_number: '0212345678'
 )
end

if Genre.count.zero?
Genre.create!(name: "ケーキ")
Genre.create!(name: "コーヒー")
Genre.create!(name: "マカロン")
Genre.create!(name: "パン")
Genre.create!(name: "アイスクリーム")
Genre.create!(name: "プリン")
Genre.create!(name: "焼き菓子")
Genre.create!(name: "キャンディ")
end

if Item.count.zero?
Item.create!(
 genre_id: 4,
 name: "ホットドックセット",
 tax_included_price: 500,
 product_description: "当店自慢のホットドックポテトセットは、ジューシーなホットドッグと香ばしいポテトが絶妙なバランスで楽しめる至福の組み合わせです。手軽に美味しさを堪能できるセットで、忙しい日常にほっと一息つけることでしょう。",
 image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/sample-food1.jpg"), filename:"sample-food1.jpg")
)
Item.create!(
 genre_id: 2,
 name: "プレスコーヒー",
 tax_included_price: 500,
 product_description: "新鮮で豆本来の風味が際立つプレスコーヒーを提供しています。こだわりの豆の選定から丁寧なブレンド、そして独自のプレス法まで、コーヒー愛好者のために特別に作り上げた一杯をお楽しみいただけます。",
 image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/sample-coffee1.jpg"), filename:"sample-coffee1.jpg")
)
Item.create!(
 genre_id: 2,
 name: "カフェオレ",
 tax_included_price: 500,
 product_description: "新鮮でクリーミーなミルクと丁寧に淹れたコーヒーが調和した、至福の一杯をお楽しみいただけます。ここは、カフェオレ愛好者のための究極の空間。香り高いコーヒーとなめらかなミルクが、心と舌を同時に満たしてくれることでしょう。",
 image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/sample-coffee2.jpg"), filename:"sample-coffee2.jpg")
)
Item.create!(
 genre_id: 2,
 name: "カフェラテ",
 tax_included_price: 500,
 product_description: "上質なエスプレッソとなめらかなミルクが織り成す、アートのようなカフェラテをお楽しみいただけます。ここは、ラテアートの魔法が織りなす、心温まる空間。カフェラテが芸術品となり、あなたの日常に幸せなひとときをお届けします。",
 image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/sample-coffee3.jpg"), filename:"sample-coffee3.jpg")
)
Item.create!(
 genre_id: 4,
 name: "パン",
 tax_included_price: 300,
 product_description: "こだわりの食材と職人の技が交わる、美味しさと温かさに溢れたパンを提供しています。毎朝焼き上げられる焼きたてパンは、香り高く、その美味しさはまるで幸せの味。ひと口食べれば、ホッと心がほどけます。",
 image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/sample-food2.jpg"), filename:"sample-food2.jpg")
)
Item.create!(
 genre_id: 1,
 name: "ショートケーキ",
 tax_included_price: 500,
 product_description: "極上のショートケーキがお待ちしています。シンプルでありながら、その一口に広がる幸福感はまるで天使のよう。贅沢な素材と職人の技術が織りなす、究極のショートケーキをご堪能ください。",
 image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/sample-cake1.png"), filename:"sample-cake1.png")
)
Item.create!(
 genre_id: 1,
 name: "チョコレートケーキ",
 tax_included_price: 500,
 product_description: "当店では、極上のチョコレートケーキが、お客様を至福の世界へと誘います。濃厚なチョコレートの風味と、丁寧に仕上げた美しいケーキが、心を満たす喜びをお届けします。",
 image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/sample-cake2.jpg"), filename:"sample-cake2.jpg")
)
Item.create!(
 genre_id: 3,
 name: "マカロン",
 tax_included_price: 500,
 product_description: "当店では、フランス発祥の美味しいお菓子、マカロンを心を込めてお届けしています。色とりどりの見た目が楽しいだけでなく、一口食べれば広がる濃厚な味わいが、心に幸せな余韻を残します。季節ごとに変わるフレーバーもお楽しみいただけます。",
 image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/sample-cake3.png"), filename:"sample-cake3.png")
)
Item.create!(
 genre_id: 1,
 name: "カップケーキ",
 tax_included_price: 500,
 product_description: "新鮮な材料を使用し、丁寧に手作りしたカップケーキで、お客様に幸せなひとときを提供します。",
 image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/sample-cake4.png"), filename:"sample-cake4.png")
)
end

