# coding: utf8
# !/usr/bin/env python

import logging
import bottle
from beaker.middleware import SessionMiddleware
import bson
from cork import Cork
from bottle import template, error
from cork.mongodb_backend import MongoDBBackend
from messages import add_user_post, get_users_post, add_comment


logging.basicConfig(format='localhost - - [%(asctime)s] %(message)s', level=logging.DEBUG)
log = logging.getLogger(__name__)
bottle.debug(True)
mb = MongoDBBackend(db_name='users', hostname='localhost', port=27017, initialize=True)
smtp_url ="starttls://username:password$@smtp.gmail.com:587"
email_sender = "From The Demo Wall Application "
aaa = Cork(backend=mb, email_sender=email_sender, smtp_url=smtp_url)
authorize = aaa.make_auth_decorator(fail_redirect="/login", role="user")

def postd():
    return bottle.request.forms


def post_get(name, default=''):
    return bottle.request.POST.get(name, default).strip()



session_opts = {
    'session.cookie_expires': True,
    'session.encrypt_key': 'cLzRnzbEwehP6ZzTREh3A4MXJyNo+TV8Hs4//EEbPbiDoo+dmNg22f2RJC282aSwgyWv/O6s3h42qrA6iHx8yfw=',
    'session.httponly': True,
    'session.timeout': 3600 * 24,  # 1 day
    'session.type': 'cookie',
    'session.validate_key': True,
}

app = bottle.app()

app = SessionMiddleware(app, session_opts)


@bottle.route('/validate_registration/:registration_code')
def validate_registration(registration_code):
    """

    :param registration_code:
    :return:Validate registration, Create User Account
    """
    aaa.validate_registration(registration_code)
    return 'Thank for Registering to the Website. <a href="/login">Go to login</a>'


@bottle.post('/login')
def login():
    """

    :return:Authenticate users
    """
    username = post_get('username')
    password = post_get('password')
    print(password)
    print(username)
    aaa.login(username, password, success_redirect='/', fail_redirect='/login')


@bottle.route('/user_is_anonymous')
def user_is_anonymous():
    """

    :return: check if user is anonymous
    """
    if aaa.user_is_anonymous:
        return 'True'

    return 'False'


@bottle.route('/logout')
def logout():
    """

    :return: logout return to login page
    """
    aaa.logout(success_redirect='/login')


@bottle.post('/register')
def register():
    """

    :return:Send out registration email
    """
    aaa.register(post_get('username'), post_get('password'), post_get('email_address'))
    return 'Please check your mailbox.'


@bottle.post('/new_message')
@authorize()
def new_message():
    """

    :return:add a new message for current logged user
    """
    session = bottle.request.environ.get('beaker.session')
    title = post_get('title')
    content = post_get('content')
    if title and content:
        add_user_post(session['_id'], session['username'], '{}'.format(content), '{}'.format(title))
        return 'Post added...'
    else:
        return 'Empty title or content not permitted...'


@bottle.post('/new_comment')
@authorize()
def new_comment():
    """
    Add a new comment
    :return:
    """
    session = bottle.request.environ.get('beaker.session')
    _id = post_get('post_id')
    comment = post_get('comment')
    print(_id)
    print(comment)
    if _id and comment:
        add_comment(_id, '{}'.format(comment), session['username'])
    bottle.redirect('/#{}'.format(_id))


@bottle.route('/')
@authorize()
def index():
    """

    :return:
    """
    session = bottle.request.environ.get('beaker.session')
    aaa.require(fail_redirect='/login')
    print session
    posts = get_users_post()
    return template('base_view', list_posts=posts)


@bottle.route('/login')
@bottle.view('login_view')
def login_form():
    """

    :return:
    """
    return {}


@bottle.route('/signup')
@bottle.view('signup_view')
def signup_view():
    """

    :return:
    """
    return {}


@error(404)
@bottle.view('error_view')
def error404(error):
    """

    :param error:
    :return:custom error 404 page
    """
    return {}


@bottle.route('/sorry_page')
def sorry_page():
    """

    :return:sorry_page
    """
    return '<p>Sorry, you are not authorized to perform this action</p>'


def main():
    """

    :return:Start the Bottle app
    """
    bottle.debug(True)
    bottle.run(app=app, quiet=False, reloader=True, host="127.0.0.1", port='10080')


if __name__ == "__main__":
    main()
