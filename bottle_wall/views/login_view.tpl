<html>

% include('header_view.tpl')
<body>

<div class="container">
    <div class="row">
        <div class="col-md-offset-5 col-md-3">
            <h4>Bottle Walls webapp demo.</h4>

            <form action="login" method="post" class="form-signin" name="login">
                <input type="text" name="username" class="form-control input-sm chat-input" value="username"/>
                <input type="password" class="form-control input-sm chat-input" name="password"/>
                <br/><br/>

                <div class="wrapper">
                        <span class="group-btn">
                <button type="submit" class="btn btn-primary btn-md">login</button>
                            <a href="/signup" class="btn btn-primary btn-md">New account <i
                                    class="fa fa-sign-in"></i></a>
               </span>
                </div>
            </form>

        </div>
    </div>
</div>
</body>
</html>