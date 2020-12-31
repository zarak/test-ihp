module Web.Mail.Users.Confirm where
import Web.View.Prelude
import IHP.MailPrelude

data ConfirmMail = ConfirmMail { user :: User }

instance BuildMail ConfirmMail where
    subject = "Subject"
    to ConfirmMail { .. } = Address { addressName = Just "Firstname Lastname", addressEmail = "fname.lname@example.com" }
    from = "hi@example.com"
    html ConfirmMail { .. } = [hsx|
        Hello World
    |]
