require 'dotenv/load'
require 'openai'

client = OpenAI::Client.new(access_token: ENV["OPENAI_TOKEN"])
client.models.list