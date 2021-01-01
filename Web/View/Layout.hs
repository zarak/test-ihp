module Web.View.Layout (defaultLayout, Html) where

import IHP.ViewPrelude
import IHP.Environment
import qualified Text.Blaze.Html5            as H
import qualified Text.Blaze.Html5.Attributes as A
import Generated.Types
import IHP.Controller.RequestContext
import Web.Types
import Web.Routes

import Application.Helper.View

defaultLayout :: Html -> Html
defaultLayout inner = H.docTypeHtml ! A.lang "en" $ [hsx|
<head>
    {metaTags}

    {stylesheets}
    {scripts}

    <title>App</title>
</head>
<body>
    {navbar}
    <div class="container mt-4">
        {renderFlashMessages}
        {inner}
    </div>
</body>
|]

navbar :: Html
navbar = [hsx|
<nav class="navbar navbar-light bg-light navbar-expand-lg">
    <a class="navbar-brand" href="/">Callout Bot</a>
    <ul class="navbar-nav mr-auto">
        <li class={classes ["nav-item", ("active", isActivePath ("/Posts" :: Text))]}>
            <a class="nav-link" href={PostsAction}>Posts</a>
        </li>
        <li class={classes ["nav-item", ("active", isActivePath ("/NewPost" :: Text))]}>
            <a class="nav-link" href={NewPostAction}>New Post</a>
        </li>
    </ul>
    {userSessionButton}
</nav>    
|]
    --where userSessionButton = logoutButtonHtml
    where userSessionButton = case currentUserOrNothing of 
                                Just user -> logoutButtonHtml user
                                Nothing -> loginButtonHtml


logoutButtonHtml :: User -> Html
logoutButtonHtml user = [hsx|
    <a class="ml-auto mr-3" href={ShowUserAction (get #id user)}>Welcome, {get #firstName user}</a>
    <a class="btn btn-outline-primary mr-0 js-delete js-delete-no-confirm"
       href={DeleteSessionAction}>Logout</a>
|]

loginButtonHtml :: Html
loginButtonHtml = [hsx|
    <a class="mr-3 ml-auto" href={NewUserAction}>Sign Up</a>
    <a class="btn btn-primary mr-0" href={NewSessionAction}>Login</a>
|]

stylesheets :: Html
stylesheets = do
    when isDevelopment [hsx|
        <link rel="stylesheet" href="/vendor/flatpickr.min.css"/>
        <link rel="stylesheet" href="/app.css"/>
    |]
    when isProduction [hsx|
        <link rel="stylesheet" href="/prod.css"/>
    |]

scripts :: Html
scripts = do
    when isDevelopment [hsx|
        <script id="livereload-script" src="/livereload.js"></script>
        <script src="/vendor/jquery-3.2.1.slim.min.js"></script>
        <script src="/vendor/timeago.js"></script>
        <script src="/vendor/popper.min.js"></script>
        <script src="/vendor/bootstrap.min.js"></script>
        <script src="/vendor/flatpickr.js"></script>
        <script src="/helpers.js"></script>
        <script src="/vendor/morphdom-umd.min.js"></script>
        <script src="/app.js"></script>
    |]
    when isProduction [hsx|
        <script src="/prod.js"></script>
    |]


metaTags :: Html
metaTags = [hsx|
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta property="og:title" content="App"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="TODO"/>
    <meta property="og:description" content="TODO"/>
|]
