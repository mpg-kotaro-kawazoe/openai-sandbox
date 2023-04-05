require 'dotenv/load'
require 'openai'

client = OpenAI::Client.new(access_token: ENV["OPENAI_TOKEN"])
puts client.models.list

file = File.open("news.txt", "r") # ファイルを読み込みモードで開く
contents = file.read # ファイルの内容を全て読み込む
file.close # ファイルを閉じる

puts contents

openai_param = {
  model: "text-davinci-003",
  max_tokens: 300,
  prompt: "次のニュースの要約を50文字かつ3行で行ってください。出力結果は箇条書き方式で3つ提示してください: #{contents}",
  n: 3,
  temperature: 0.5,
}

response =  client.completions(
  parameters: openai_param
)

null = nil
puts response

a = {
  "id":"cmpl-71yeYgI4T2neLiRKjA8eXQbYhStUD",
  "object":"text_completion",
  "created":1680705834,
  "model":"text-davinci-003",
  "choices":[
    {"text":"\n4月1日に山川渓流釣りが解禁され、釣りファンの間で待ち望まれている。しかし、雪解けなどのため、一部の釣り場ではまだ早い時期に行けないこともある。解禁時には、マスク着用や手指の消毒など冠状ウイルス","index":0,"logprobs":null,"finish_reason":"length"},
    {"text":"\n4月1日から山川渓流釣りが解禁され、釣りファンが待ち遠しい。しかし、新型コロナのためマスクやソーシャルディスタンスなどの感染症対策、資源保護の観点から漁獲制限が行われる。釣り人は協力し、安全な釣","index":1,"logprobs":null,"finish_reason":"length"},
    {"text":"\n4月1日から渓流釣り解禁となり、釣りファンは待ちかねていた。一方で、新型コロナウイルスの影響で感染症対策や自然保護の対策も求められる。今年も安全・守秩序な渓流釣りライフを過ごすためにマスク","index":2,"logprobs":null,"finish_reason":"length"},
    {"text":"\n4月1日から山川渓流釣りが解禁された。釣りファンは喜び、特集が組まれた。コロナ防止のためマスク着用や消毒などの注意書きがあり、乱獲防止のためルールの守ることが求められる。釣り人は感染対策を守","index":3,"logprobs":null,"finish_reason":"length"},
    {"text":"\n2020年4月から渓流釣りの解禁が始まり、釣りを楽しみたい釣りファンが待ち望んでいます。感染症対策も釣り場で必要となり、マスク着用や消毒、ソーシャルディスタンスの実施が求められます。一方で資源の乱獲防止","index":4,"logprobs":null,"finish_reason":"length"}],
    "usage":{"prompt_tokens":850,"completion_tokens":748,"total_tokens":1598}}