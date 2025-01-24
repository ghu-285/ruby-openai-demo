# Write your solution here!
require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

line = ""

50.times do
  line += "-"
end

request = ""
message_list = []

while request != "bye"
  pp line
  pp "Hello! How can I help you today?"
  request = gets.chomp
  message_list.push({"role" => "user", "content" => request})
  api_response = client.chat(
    parameters: {
      model: "gpt-4",
      messages: message_list
    }
  )
  response = api_response["choices"][0]["message"]["content"]
  message_list.push("role" => "system", "content" => response)
  pp response
end
