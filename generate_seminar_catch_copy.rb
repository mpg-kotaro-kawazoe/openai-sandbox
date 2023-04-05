require 'dotenv/load'
require 'openai'

client = OpenAI::Client.new(access_token: ENV["OPENAI_TOKEN"])
puts client.models.list

file = File.open("seminar_program.txt", "r") # ファイルを読み込みモードで開く
contents = file.read # ファイルの内容を全て読み込む
file.close # ファイルを閉じる

puts contents

openai_param = {
  model: "text-davinci-003",
  max_tokens: 300,
  prompt: "次のセミナープログラム全体のキャッチコピーを考えてください、セミナープログラムは-で区切られており、1つのプログラムはセミナータイトル、紹介文、セミナーコンテンツの3つで構成されています: #{contents}",
  n: 3,
  temperature: 0.5,
}

response =  client.completions(
  parameters: openai_param
)

# completion APIからlogprobキーにnullがセットされて返ってくるためエラーを回避するためにnullを変数化している
null = nil
puts response