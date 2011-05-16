require.paths.unshift  '.'
express = require 'express'
models = require 'models'
app = module.exports = express.createServer()

app.configure ->
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser()
  app.use express.session { secret: 'your secret here' }
  app.use app.router
  app.use express.static(__dirname + '/public')

app.dynamicHelpers
  base: ->
    if '/' is app.route then '' else app.route

app.configure 'development', ->
  app.use express.errorHandler { dumpExceptions: true, showStack: true }

app.configure 'production', ->
  app.use express.errorHandler()

#Routes

app.get '/', (req, res) ->
  locals = {}
  #models.License.all.on("success", (result) ->
  # Here be the results of the query, #Todo: put the result in the locals hash
  #)
  locals["title"] = "License Manager index"
  # Here be fake liceses. #Todo: Remove when query above works as expected
  licenses = (models.License.build('name':'Sune Mang', 'product':'intellij '+num, 'key':'1234'+num) for num in [10..1])
  locals["licenses"]=licenses
  res.render 'index', locals: locals

app.get '/new', (req, res) ->
  license = models.License.build()
  res.render 'new', locals: { license: license }

app.post '/new', (req, res) ->
  license = req.body.license
  console.log license
  o = models.License.build
      'name': license.user
      'product': license.product
      'key' : license.key

  o.save().on("success", ->
    res.redirect '/'
  )
  .on("failure", ->
    res.render 'new', locals: { license: license }
  )

#Only listen on $ node app.js

if !module.parent
  app.listen 3000
  console.log "Express server listening on port %d", app.address().port

