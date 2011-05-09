get '/': ->
  'Hej Peter och Jensa!'

get '/users/:name':  ->
  "Hi, #{@name}!"
