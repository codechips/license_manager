Sequelize = require 'sequelize'
sql = new Sequelize('licenses', 'root')

User = sql.define "User"
  firstName : Sequelize.STRING
  lastName : Sequelize.STRING

User.sync

exports.User = User

License = sql.define "License"
  firstName : Sequelize.STRING
  lastName : Sequelize.STRING

License.sync

exports.License = License

