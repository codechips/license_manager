Sequelize = require 'sequelize'
sql = new Sequelize('licenses', 'root')

User = sql.define "User"
  email : Sequelize.STRING
  firstName : Sequelize.STRING
  lastName : Sequelize.STRING

User.sync()

exports.User = User

License = sql.define "License"
  version : Sequelize.STRING
  product : Sequelize.STRING
  key : Sequelize.STRING

License.sync()

exports.License = License

