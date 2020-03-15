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

CodeList.create!(
  title:            "迷惑メールにされないメール設定方法 G Suite編",
  content:          "Gmailで表示される「？」マークは迷惑メールとして判定される前段階の状態、このまま放置しておくと迷惑メールとしてメールが届かなくなります。この状態にならないため早めの対策が必要です。\nこれらの技術はSPFとDKIMによって行われます。SPFはメール送信する場所の正当性、DKIMは送信するメールサーバーの正当性を検証する技術になります。",
  picture:          open("#{Rails.root}/db/images/a.jpg"),
  url:              "https://bright-system.booth.pm/items/1475698",
  hint:             CodeList.digest('gishohaku2019'),
  user_id:          1,
  created_at: Time.zone.now,
  updated_at: Time.zone.now,
)
