from app import app
from flaskext.mysql import MySQL

mysql = MySQL()
app.config['DEBUG'] = 'True'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'Mario.crv208'
app.config['MYSQL_DATABASE_DB'] = 'P1_201908338'
mysql.init_app(app)

