require 'sinatra'


get '/' do
  whom = File.open("whom.txt").read
  "Hello, #{whom}"
end
