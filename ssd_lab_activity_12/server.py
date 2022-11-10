import os
from flask import Flask, render_template, request, url_for, redirect
from flask_sqlalchemy import SQLAlchemy
from flask_login import (LoginManager,login_manager,login_user, logout_user, login_required, UserMixin)

from sqlalchemy.sql import func
basedir = os.path.abspath(os.path.dirname(__file__))

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] =\
        'sqlite:///' + os.path.join(basedir, 'database.db')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)
login_manager=LoginManager()
login_manager.init_app(app)
class details(UserMixin,db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name= db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(80), unique=True, nullable=False)
    password= db.Column(db.String(100), nullable=False)
    created_at = db.Column(db.DateTime(timezone=True),server_default=func.now())

    def __repr__(self):
        return f'<details {self.name}>'

    def get_id(self):
        return self().email


@login_manager.user_loader
def load_user(user_id):
    return details.query.get(int(user_id))

@app.route('/signin', methods = ['POST'])
def signin():
    if(request.method== 'POST'):
        req = request.get_json()
        email = req['email']
        password=req['password']
        check_user = details.query.filter_by(email=email)
        if(check_user is not None):
            if(check_user.password==password):
                login_user(check_user)
                return "LOGGED in successfully"
            else:
                return "Incorrect Password"
        else:
            return "No such User exists"


@app.route('/signup/',methods=('GET', 'POST'))
def create():
    if request.method=='POST':
        req = request.get_json()
        name=req['name']
        email = req['email']
        password=req['password']
        user=details(name=name,email=email,password=password)
        db.session.add(user)
        db.session.commit()
        return "Signup successfull"


@app.route('/')
def index():
    students=details.query.all()
    return students
app.run(debug = True)  