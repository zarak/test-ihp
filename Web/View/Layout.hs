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
    <div class="bg-gray-100 overflow-x-hidden">
        {navbar}
        <div class="px-6 py-8">
            {renderFlashMessages}
            {inner}
        </div>
    </div>
</body>
|]

navbar :: Html
navbar = [hsx|
<nav class="bg-gray-700 p-4 flex justify-between items-center">
    <!--left side-->
    <div class="flex items-center">
        <img
        src="https://cdn3.iconfinder.com/data/icons/complete-set-icons/512/twitter2512x512.png"
        alt="logo" width="50" class="mr-2"/>
        
        <a class="inline-block p-3 text-red-50 hover:text-red-400 transition ease-in duration-150" href="/">Callout Bot</a>
        <a class="inline-block p-3 text-red-50 hover:text-red-400 transition ease-in duration-150" href={PostsAction}>Posts</a>
        <!--<ul class="navbar-nav mr-auto">-->
            <!--<li class={classes ["nav-item", ("active", isActivePath ("/Posts" :: Text))]}>-->
                <!--<a class="nav-link" href={PostsAction}>Posts</a>-->
            <!--</li>-->
            <!--<li class={classes ["nav-item", ("active", isActivePath ("/NewPost" :: Text))]}>-->
                <!--<a class="nav-link" href={NewPostAction}>New Post</a>-->
            <!--</li>-->
        <!--</ul>-->
            
    </div>

    <!--right side -->
    <div>
        {userSessionButton}
    </div>
</nav>    
|]
    --where userSessionButton = logoutButtonHtml
    where userSessionButton = case currentUserOrNothing of 
                                Just user -> logoutButtonHtml user
                                Nothing -> loginButtonHtml


logoutButtonHtml :: User -> Html
logoutButtonHtml user = [hsx|
    <a class="inline-block ml-auto mr-3 text-red-50 hover:text-red-400 transition ease-in duration-100" href={ShowUserAction (get #id user)}>Welcome, {get #firstName user}</a>
    <a class="inline-block mr-0 text-red-100 bg-red-500 px-4 py-2 rounded hover:bg-red-400 hover:text-red-50 transition ease-in duration-100 js-delete js-delete-no-confirm"
       href={DeleteSessionAction}>Logout</a>
|]

loginButtonHtml :: Html
loginButtonHtml = [hsx|
    <a class="mr-3 ml-auto text-red-50 hover:text-red-400 transition ease-in duration-100" href={NewUserAction}>Sign Up</a>
    <a class="inline-block mr-0 text-red-100 bg-red-500 px-4 py-2 rounded hover:bg-red-400 hover:text-red-50 transition ease-in duration-100"
    href={NewSessionAction}>Login</a>
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
