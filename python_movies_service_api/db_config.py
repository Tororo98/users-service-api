from app import app
from flaskext.mysql import MySQL
from flask_jwt_extended import JWTManager

mySQL = MySQL()

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'admin'
app.config['MYSQL_DATABASE_PASSWORD'] = '3ad853f1abc94a67dc9ceed07547d5aa6dd5ce129611feb2'
app.config['MYSQL_DATABASE_DB'] = 'dinerUser'
app.config['MYSQL_DATABASE_HOST'] = 'MySQLServiceDB'   #'172.20.0.2' #'MySQLServiceDB'
app.config['MYSQL_DATABASE_PORT'] = 33060
mySQL.init_app(app)

# Setup the Flask-JWT-Extended extension
app.config['JWT_SECRET_KEY'] = 'mySecretKey'  # Change this!
app.config['JWT_ALGORITHM'] = 'HS512'
jwt = JWTManager(app)
