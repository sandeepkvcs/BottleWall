<!-- Modal -->
<div class="modal fade" id="myModalNorm" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" xmlns="http://www.w3.org/1999/html">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    Add a new message ...
                </h4>
            </div>

            <!-- Model Body -->
            <div class="modal-body">
                <form id="newpostform" class="form-signin" name="new_post">
                    <div class="form-group">
                        <label for="title">Message Title...</label>
                        <input type="text" class="form-control"
                               id="title" placeholder="Enter title"/>
                    </div>
                    <div class="form-group">
                        <label for="content">Write Something Funny ...</label>
                        <textarea rows="15" class="form-control" id="content" placeholder="Enter content"></textarea>
                    </div>

                    <button type="submit" id="submit" class="btn btn-default">Submit new message</button>
                </form>


            </div>
        </div>
    </div>
</div>
<br/>
<br/>

<div class="container">
    <div class="row">
        <div class="col-md-1"></div>

        <div class="col-md-6">

            % for post in list_posts:
            <div class="panel">
                <div class="panel-heading">
                    <div class="text-center">

                        <div class="row">

                            <div class="col-sm-9">
                                <h3 class="pull-left">{{ post['title'] }}</h3>
                            </div>
                            <div class="col-sm-3">
                                <h4 class="pull-right">

                                </h4>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel-body">
                    {{ post['content'] }}
                </div>

                <div class="panel-footer">
                    <span class="label label-default">Author: {{ post['users_name']  }}</span>
                    <span class="label label-default"><small><em>Date: {{ post['date'] }}</em></small></span>
                    <span class="label label-default"><small><a id="{{ post['_id']}}">#{{ post['_id'] }}</a></small></span>

                </div>
                <div class="well">

                    <h4>Leave a comment</h4>

                    <form  name="new_comment{{post['_id']}}"  action='new_comment'  method="POST" class="clearfix">

                        <div class="col-md-6 form-group">
                            <input type="hidden" name='post_id' class="form-control" id="post_id" placeholder="post_id" value="{{ post['_id'] }}">
                        </div>

                        <div class="col-md-12 form-group">
                            <label class="sr-only" for="comment">Comment</label>
                            <textarea name='comment' rows='3' class="form-control" id="comment" placeholder="Comment"></textarea>
                        </div>

                        <div class="col-md-12 form-group text-right">
                            <input type="submit" id="submit_comment" class="btn btn-primary"/>
                        </div>

                    </form>
                    <p>
                            <em>Previous comments</em>
                        </p>
                    % for comment in post['comments']:
                    <ul id="comments" class="comments">

                        <div class="clearfix">

                            <h4 class="pull-left">{{ comment['name'] }}</h4>

                            <p class="pull-right">{{ comment['date'] }}</p>
                        </div>
                        <p>
                            <em>{{ comment['comment'] }}</em>
                        </p>

                    </ul>
                    % end
                </div>
            </div>
            % end

        </div>

    </div>
</div>
