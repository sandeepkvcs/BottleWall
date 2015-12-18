<!DOCTYPE html>
<html lang="en">

     % include('header_view.tpl')

<body data-spy="scroll" data-target=".navbar" data-offset="50">
<nav class="navbar navbar-inverse navbar-fixed-top">
    ...
    <ul class="nav navbar-nav">
        <li><a href="/logout">Logout</a></li>

    </ul>
</nav>
 <br />
<div class="text-right">
     <br />
 <br />
    <span class="submit">

        <button class="btn btn-primary" data-toggle="modal" data-target="#myModalNorm">New Message ...</button>
    </span>

</div>


% include('user_wall_view.tpl')

</body>
</html>