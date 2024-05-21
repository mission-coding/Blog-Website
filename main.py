from flask import Flask, render_template, request, session, redirect, flash
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
from flask_mail import Mail
import os
import math
from werkzeug.utils import secure_filename

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

app = Flask(__name__)
app.config.update(
    MAIL_SERVER = "smtp.gmail.com",
    MAIL_PORT = "465",
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['mail_id'],
    MAIL_PASSWORD = params['mail_pass']
)
app.config['UPLOAD_FOLDER'] = params['upload_location']
mail = Mail(app)
local_sever = bool(params['local_sever'])

if local_sever:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)
app.secret_key = params['secret_key']

class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(20), nullable = False)
    email = db.Column(db.String(30), nullable = False)
    phone = db.Column(db.String(12), nullable = False)
    message = db.Column(db.String(400), nullable = False)
    date = db.Column(db.String(25), nullable = False)

class Posts(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    title = db.Column(db.String(50), nullable = False)
    sub_title = db.Column(db.String(50), nullable = False)
    content = db.Column(db.String(4000), nullable = False)
    slug = db.Column(db.String(30), nullable = False)
    date = db.Column(db.String(25), nullable = False)
    img = db.Column(db.String(30), nullable = False)

@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['num_of_posts']))
    page = request.args.get('page')
    if not str(page).isnumeric():
        page = 1
    page = int(page)
    j = (page-1)*int(params['num_of_posts'])
    posts = posts[j: j + int(params['num_of_posts'])]

    if page==1:
        prev = "#"
        next = "/?page="+ str(page+1)
    elif page==last:
        prev = "/?page="+ str(page-1)
        next = "#"
    else:
        prev = "/?page="+ str(page-1)
        next = "/?page="+ str(page+1)

    return render_template("index.html", params = params, posts = posts, 
                           prev=prev, next=next, page=page, last=last)

@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first_or_404()
    return render_template('post.html', params=params, post=post)

@app.route("/about")
def about():
    return render_template("about.html", params = params)

@app.route("/dashboard", methods=["GET", "POST"])
def dashboard():
    if "user" in session and session['user'] == params['admin_user']:
        posts = Posts.query.all()
        return render_template("dashboard.html", params=params, posts=posts)

    if request.method == "POST":
        username = request.form.get("uname")
        userpass = request.form.get("pass")

        if username == params["admin_user"] and userpass == params["admin_pass"]:
            session['user'] = username
            posts = Posts.query.all()
            return render_template("dashboard.html", params=params, posts=posts)
    return render_template("login.html", params=params)

@app.route("/edit/<string:id>", methods = ["GET", "POST"])
def edit(id):
    if "user" in session and session['user'] == params['admin_user']:
        if request.method == "POST":
            post = Posts.query.filter_by(id=id).first()
            post.title = request.form.get('title')
            post.sub_title = request.form.get('subtitle')
            post.slug = request.form.get('slug')
            post.img = request.form.get('img_file')
            post.content = request.form.get('content')
            db.session.commit()
            flash("Edit Saved Successfully !!", "success")
            return redirect("/edit/"+id)
            
    post = Posts.query.filter_by(id=id).first()
    return render_template('edit.html', params=params, post=post)

@app.route("/create", methods = ["GET", "POST"])
def create():
    if "user" in session and session['user'] == params['admin_user']:
        if request.method == "POST":
            title = request.form.get('title')
            subtitle = request.form.get('sub')
            subtitle = request.form.get('subtitle')
            content = request.form.get('content')
            slug = request.form.get('slug')
            img_file = request.form.get('img_file')
            date = datetime.now()

            post = Posts(title=title, sub_title=subtitle, content=content, slug=slug, img=img_file, date=date)
            db.session.add(post)
            db.session.commit()
            flash("New Post Created Successfully !!", "success")
            return redirect("/dashboard")
        
    post = Posts.query.filter_by(id=id).first()
    return render_template('create.html', params=params, post=post)

@app.route("/delete/<int:id>")
def delete(id):
    if "user" in session and session['user'] == params['admin_user']:
        post = Posts.query.get_or_404(id)
        db.session.delete(post)
        db.session.commit()
        flash("Post Deleted Successfully !!", "success")
        return redirect('/dashboard')
    return redirect('/dashboard')

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect("/dashboard")

@app.route("/uploader", methods = ["GET", "POST"])
def uploader():
    if "user" in session and session['user'] == params['admin_user']:
        if request.method == "POST":
            file = request.files['file']
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(file.filename)))
            flash("File Uploaded Successfully !!", "success")
    return redirect("/dashboard")

@app.route("/contact", methods = ["GET", "POST"])
def contact():
    if request.method == "POST":
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        
        entry = Contacts(name = name, email = email, phone = phone, message = message, date = datetime.now())
        db.session.add(entry)
        db.session.commit()
 
        mail.send_message("Contact from BlogForBloggers",
                          sender = email,
                          recipients = [params['mail_id']],
                          body = "Message: " + message + "\n"
                            + "Phone: " + phone + "\n"
                             + "Name: "+ name
                          )

        flash("Message Sent Successfully !!", "success")
    return render_template("contact.html", params = params)
app.run(debug=True)