In my application the user can log in and see see what others are posting and he can also comment on that. Also User can post a new post for his friends to see. I have uses Bottle as WSGI server and Mongo DB for storing the data of the application.
The default bottle framework doesn't enable authentication or authorization, except basic authentication which is not really cool therefore this not works with Mongo DB. For this reason I have used cork-bottle plugin which allow us to implement simple authentication and authorization on top of Mongo DB The process is: Registration account is pending (users. pending registrations) Send an email with a link for account verification. After the link is clicked account is verified for the user.
We should activate your application by following procedure. In order for the bottle-cork authorization plugin to use Gmail as your SMTP provider/server for sending mail for account registration
just activate the fact that application with poor authentication are able to act as you
    smtp_url = "starttls://gmail_username:gmail_password@smtp.gmail.com:587"
In order to work you need to make certain changes into your Gmail account
Gmail Account > Settings > Accounts > Other Google Account settings > Security > Connected applications and sites > Review permissions.
The dependencies for my application to work
Beaker            :1.7.0(For Session Management)
Bottle              :0.12.9(For Client Server)
Bottle-cork      :0.12.0(For Authentication)
Pycrypto          :2.6.1(For encryption of the password stored)
Pymongo         :3.2
Wsgiref            :0.1.2

I future I want to add more feature like liking the comments and only friends who have can follow their posts. Also use more HTML CSS stuff to make it more attractive.






