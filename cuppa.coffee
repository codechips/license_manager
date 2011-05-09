get '/': ->
  render 'index'

get '/users/:name':  ->
  'Hej Peter och Jensa!'

view index: ->
  h1 'Hello'

layout ->
  doctype 5
  html ->
    head ->
      meta charset: 'utf-8'
    body -> @content
