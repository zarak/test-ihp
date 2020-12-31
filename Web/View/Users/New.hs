module Web.View.Users.New where
import Web.View.Prelude

data NewView = NewView { user :: User }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={UsersAction}>Users</a></li>
                <li class="breadcrumb-item active">New User</li>
            </ol>
        </nav>
        <h1>New User</h1>
        {renderForm user}
    |]

renderForm :: User -> Html
renderForm user = formFor user [hsx|
    {(textField #firstName)}
    {(textField #lastName)}
    {(textField #email)}
    {(passwordField #passwordHash) { fieldLabel="Password" }}
    {(passwordField #passwordHash) { fieldName="password2", fieldLabel="Confirm Password" }}
    {(textField #failedLoginAttempts)}
    {submitButton}
|]
