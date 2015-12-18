<html>

% include('header_view.tpl')
<body>

<div class="container">
    <div class="row">
        <div class="col-md-offset-5 col-md-3">
            <h4>Create a new user.</h4>
            <form action="/register" method="POST" class="form-signin" name="signup">
                <input type="text" name="username" class="form-control input-sm chat-input" value="username" placeholder="username"/>
                <input type="password" class="form-control input-sm chat-input" name="password" placeholder="password"/>
                 <input type="text"  class="form-control input-sm chat-input"  name="email_address" value="email address" placeholder="email address"/>
                <br/><br/>
                <div class="wrapper">
                        <span class="group-btn">
                <button type="submit" class="btn btn-primary btn-md"> Creat account</button>
               </span>
                    </div>
            </form>

        </div>
    </div>
</div>
</body>
</html>