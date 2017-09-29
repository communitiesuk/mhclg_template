var path = require('path')
var express = require('express')
var nunjucks = require('nunjucks')
var routes = require('./express_documentation/app/routes.js')
var app = express()
var bodyParser = require('body-parser')
var config = require('./express_documentation/app/config.js')
var port = (process.env.PORT || 3000)
var IS_HEROKU = process.env.hasOwnProperty('IS_HEROKU')
var version = "0.0.2"
var template_path = '/pkg/jinja_hackney_template-' + version


module.exports = app

// Application settings
app.set('view engine', 'html')

// Set the location of the views and govuk_template layout file
var appViews = [
  path.join(__dirname, '/express_documentation/app/views'),
	path.join(__dirname, template_path + '/views/layouts')
]

// Tell nunjucks we are using express to serve the templates within
// the views defined in appViews
nunjucks.configure(appViews, {
  express: app,
  autoescape: true,
  watch: true,
  noCache: true
})

// Middleware to serve static assets
app.use('/public', express.static(path.join(__dirname, '/express_documentation/public')))
app.use('/public', express.static(path.join(__dirname, template_path + '/assets')))
app.use('/public', express.static(path.join(__dirname, '/node_modules/govuk_frontend_toolkit')))

// Support for parsing data in POSTs
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
  extended: true
}))

// send assetPath to all views
app.use(function (req, res, next) {
  res.locals.asset_path = '/public/'
  next()
})

// Add variables that are available in all views
app.use(function (req, res, next) {
  res.locals.cookieText = config.cookieText
  next()
})

// routes (found in routes.js)

routes.bind(app, '/public/')

// start the app

app.listen(port, function () {
  if (!IS_HEROKU) {
    console.log('Listening on port ' + port + '   url: http://localhost:' + port)
  }
})
