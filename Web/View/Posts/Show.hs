module Web.View.Posts.Show where
import Web.View.Prelude

import qualified Text.MMark as MMark

data ShowView = ShowView { post :: Post }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PostsAction}>Posts</a></li>
                <li class="breadcrumb-item active">Show Post</li>
            </ol>
        </nav>
        <h1>Show Post</h1>
        <p>{get #createdAt post |> timeAgo}</p>
        <h3>{get #title post}</h3>
        <div>{get #body post |> renderMarkdown}</div>

        <a href={NewCommentAction}>Add Comment</a>
    |]

renderMarkdown text =
    case text |> MMark.parse "" of
      Left _ -> "Something went wrong"
      Right markdown -> MMark.render markdown 
                                     |> tshow
                                     |> preEscapedToHtml
