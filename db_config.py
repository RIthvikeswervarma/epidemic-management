import os
from flask_mysqldb import MySQL
from dotenv import load_dotenv

load_dotenv()


def init_mysql(app):
    app.config['MYSQL_HOST'] = os.getenv('DB_HOST', 'localhost')
    app.config['MYSQL_PORT'] = int(os.getenv('DB_PORT', '3306'))
    app.config['MYSQL_USER'] = os.getenv('DB_USER', 'root')
    app.config['MYSQL_PASSWORD'] = os.getenv('DB_PASSWORD', 'varma@2905')
    app.config['MYSQL_DB'] = os.getenv(
        'DB_NAME', 'epidemic_management'
    )

    return MySQL(app)
