User.create!(
  provider:         "twitter",
  uid:              "972251125108809733",
  nickname:         "sapi_kawahara",
  name:             "さっぴー川原🍶勉強会が中止になりまくって悲しい",
  image_url:        "http://pbs.twimg.com/profile_images/1201277107772383232/91hyES1T_normal.jpg",
  description:      "昔ゲーム機ソフトを作ってたITエンジニアで日本酒好き。 Perl / PHP / Java / Python / Ruby / C++ /エンジニアの登壇を応援する会 #engineers_lt #技書博 #技術書典 #builderscon #インターネット老人会LT #techbook_meetup #phpcon",
  created_at: Time.zone.now,
  updated_at: Time.zone.now,
)

Codelist.create!(
  content:          "迷惑メールにされないメール設定方法 G Suite編",
  url:              "https://bright-system.booth.pm/items/1475698",
  password_digest:  Codelist.digest('gishohaku2019'),
  user_id:          1,
  created_at: Time.zone.now,
  updated_at: Time.zone.now,
)