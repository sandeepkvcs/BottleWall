# coding: utf8
"""
manipulating collection:
- posts have this document structure :
- comments is an embedded document (in posts) meaning you can push others comment in.
{
        "_id" : ObjectId("566b47baf99ba44beb00e2ae"),
        "comments" : [
                {
                        "date" : "",
                        "comment" : "",
                        "name" : ""
                },
                {
                        "comment" : "We love Star Wars",
                        "date" : "2015-12-11 23:01:46.041007",
                        "name" : "messagebot"
                },
                {
                        "comment" : "Me too bro",
                        "date" : "2015-12-11 23:04:23.191647",
                        "name" : "test"
                },
                {
                        "comment" : "Lets Watch it Together",
                        "date" : "2015-12-12 00:03:50.740583",
                        "name" : "messagebot"
                }
        ],
        "content" : "Pray for all the victims in the world!!",
        "date" : "2015-12-11 23:01:30.840361",
        "title" : "#PrayForParis",
        "users_id" : "e21b59e62d7c47959678d31d4b4ef06f",
        "users_name" : "messagebot"
}




"""
from cork.mongodb_backend import MongoDBBackend
import pymongo
import datetime
from bson import ObjectId

__author__ = 'Sandeep V kottur'


def init():
    """

    :return:
    """
    client = pymongo.MongoClient(host='127.0.0.1', port=27017, document_class=dict)
    return client


def add_user_post(user_id, username, content, title):
    """
    :param user:
    :param post:
    :return:
    """
    c = init()
    posts = c.posts
    posts.db.insert({'users_name': username,
                     'users_id': user_id,
                     'content': '{}'.format(content),
                     'title': '{}'.format(title),
                     'date': '{}'.format(datetime.datetime.now()),
                     'comments': [{'name': '',
                                   'date': '',
                                   'comment': ''}]})


def add_comment(post_id, comment, username):
    """
     add a comment
    :param post_id:
    :param comment:
    :param username:
    :return:
    """
    c = init()
    posts = c.posts.db
    posts.update_one({'_id': ObjectId('{}'.format(post_id))},
                    {
                        '$push': {
                            'comments': {
                                'name': username,
                                'comment': '{}'.format(comment),
                                'date': '{}'.format(datetime.datetime.now())

                            }
                        }
                    }
                    )


def get_users_post():
    """

    :return:user_posts sorted by date
    """
    c = init()
    posts = c.posts
    user_posts = [user_posts for user_posts in posts.db.find().sort('date', pymongo.DESCENDING)]
    print user_posts
    return user_posts


def populate_mongodb_backend():
    """

    :return: method for adding manually a document user in users collection and the roles for cork
             do only on a fresh mongodb install, db within the app was previously initialize with this.
    """
    mb = MongoDBBackend(db_name='users', hostname='localhost', port=27017, initialize=True)
    mb.users._coll.insert_one({
        "login": "admin",
        "email_addr": "admin@localhost.local",
        "desc": "admin test user",
        "role": "user",
        "hash": "cLzRnzbEwehP6ZzTREh3A4MXJyNo+TV8Hs4//EEbPbiDoo+dmNg22f2RJC282aSwgyWv/O6s3h42qrA6iHx8yfw=",
        "creation_date": "2018-08-28 05:11:14"
    })

    mb.roles._coll.insert_one({'role': 'administrator', 'val': 100})
    mb.roles._coll.insert_one({'role': 'user', 'val': 50})
    return mb


if __name__ == '__main__':
    pass
    # populate_mongodb_backend()
    # add_comment('566b1662f99ba425030a34a6', 'comment for testing', 'messagebot')
