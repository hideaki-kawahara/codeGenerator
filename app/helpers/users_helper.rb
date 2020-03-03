module UsersHelper
  # 引数で与えられたユーザーのGravatar画像を返す
  def gravatar_for(user)
    gravatar_url = user[:image_url]
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
