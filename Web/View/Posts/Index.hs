module Web.View.Posts.Index where
import Web.View.Prelude

data IndexView = IndexView { posts :: [Post] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={PostsAction}>Posts</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewPostAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Posts</th>
                        <th>Upvotes</th>
                        <th>Downvotes</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach posts renderPost}</tbody>
            </table>
        </div>
    |]


renderPost post = [hsx|
    <tr>
        <td>
        <!--<a href={ShowPostAction (get #id post)} data-toggle="popover" data-content={get #body post} data-trigger="hover">{get #title post}</a>-->
        <div class="post m-auto">
            <h5>{get #title post}</h5>
            <p>
                {get #body post}
            </p>
        </div>
        </td>
        <td>{get #upvotes post}</td>
        <td>{get #downvotes post}</td>
        <!--<td><a href={EditPostAction (get #id post)} class="text-muted">Edit</a></td>-->
        <!--<td><a href={DeletePostAction (get #id post)} class="js-delete text-muted">Delete</a></td>-->
    </tr>
|]
