<head>
    <meta charset="utf-8"/>
    <title>Messages POC</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <!--CSS-START-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
          integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
          integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
            integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
            crossorigin="anonymous"></script>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <!--CSS-END-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<script type="text/javascript">
$(function() {
 $("button#submit").click(function(){
   var title = $('#title').val();
   var content = $('#content').val();
   $.ajax({
             type: "POST",
             url: "new_message",
             data: 'title=' + title + '&content=' + content,
             success: function(msg){
                 //alert(msg)
             },
            error: function(){
                alert("failure");
            }
       });
    });
});


</script>
<style>
span.submit {
    writing-mode:tb-rl;
    z-index:999;
    position: fixed;
    top:45%;
    padding: 5px 10px;
    right: -24px;
    cursor: pointer;
    border: none;
    background: #6B5645;
    font-weight: bold;
    color: #fff;
    text-shadow: 0 1px 1px #6B5645;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#6B5645), to(#513E2F));
    background-image: -webkit-linear-gradient(#6B5645, #513E2F);
    background-image: -moz-linear-gradient(#6B5645, #513E2F);
    background-image: -ms-linear-gradient(#6B5645, #513E2F);
    background-image: -o-linear-gradient(#6B5645, #513E2F);
    background-image: linear-gradient(#6B5645, #513E2F);
    -moz-border-radius-topleft: .6em;
    -webkit-border-top-left-radius: .6em;
    border-top-left-radius: .6em;

    -moz-border-radius-topright: .6em;
    -webkit-border-top-right-radius: .6em;
    border-top-right-radius: .6em;

    -moz-box-shadow: 0 0 12px rgba(0, 0, 0, .6);
    -webkit-box-shadow: 0 0 12px rgba(0, 0, 0, .6);
    box-shadow: 0 0 12px rgba(0, 0, 0, .6);

    -webkit-transform:rotate(-90deg);
    -moz-transform:rotate(-90deg);
    -o-transform:rotate(-90deg);
}
</style>
</head>