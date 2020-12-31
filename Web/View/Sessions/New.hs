module Web.View.Sessions.New where

import Web.View.Prelude
import IHP.AuthSupport.View.Sessions.New

instance View (NewView User) where
    html NewView { .. } = [hsx|
<div id="sessions-new" class="h-100">
    <div class="d-flex align-items-center">
        <div class="w-100">
            <div class="mx-auto mb-5" style="max-width: 400px">
                {renderFlashMessages}
                <h5>Please login:</h5>
                {renderForm user}
            </div>
        </div>
    </div>
</div>
|]

renderForm :: User -> Html
renderForm user = [hsx|
<form action={CreateSessionAction} method="POST" accept-charset="utf-8">
    <div class="form-group">
        <input 
            type="email" 
            value={get #email user} 
            name="email"
            id="email"
            class="form-control"
            placeholder="E-mail"
        />
    </div>
    <div class="form-group">
        <input
            class="form-control"
            type="password"
            name="password"
            placeholder="Password"
        />
    </div>
    <button class="btn btn-primary btn-block" type="submit">Login</button>
</form>    
|]
