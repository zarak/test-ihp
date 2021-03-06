module Admin.Controller.Admins where

import Admin.Controller.Prelude
import Admin.View.Admins.Index
import Admin.View.Admins.New
import Admin.View.Admins.Edit
import Admin.View.Admins.Show

instance Controller AdminsController where
    beforeAction = ensureIsAdmin @Admin

    action AdminsAction = do
        admins <- query @Admin |> fetch
        render IndexView { .. }

    action NewAdminAction = do
        let admin = newRecord
        render NewView { .. }

    action ShowAdminAction { adminId } = do
        admin <- fetch adminId
        render ShowView { .. }

    action EditAdminAction { adminId } = do
        admin <- fetch adminId
        render EditView { .. }

    action UpdateAdminAction { adminId } = do
        admin <- fetch adminId
        admin
            |> buildAdmin
            |> ifValid \case
                Left admin -> render EditView { .. }
                Right admin -> do
                    admin <- admin |> updateRecord
                    setSuccessMessage "Admin updated"
                    redirectTo EditAdminAction { .. }

    action CreateAdminAction = do
        let admin = newRecord @Admin
        admin
            |> buildAdmin
            |> ifValid \case
                Left admin -> render NewView { .. } 
                Right admin -> do
                    hashed <- hashPassword (get #passwordHash admin)
                    admin <- admin 
                        |> set #passwordHash hashed
                        |> createRecord
                    setSuccessMessage "You have registered successfully"
                    redirectTo NewSessionAction

    action DeleteAdminAction { adminId } = do
        admin <- fetch adminId
        deleteRecord admin
        setSuccessMessage "Admin deleted"
        redirectTo AdminsAction

buildAdmin admin = admin
    |> fill @["email","passwordHash","failedLoginAttempts"]
    |> validateField #email isEmail
    |> validateField #passwordHash nonEmpty
    |> validateField #passwordHash (hasMinLength 8)
    |> validateField #passwordHash (passwordMatch (param "password2"))

passwordMatch pw1 pw2 = if (pw1 == pw2)
                           then Success
                           else Failure "Password must match"
