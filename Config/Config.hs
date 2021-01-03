module Config where

import IHP.Prelude
import IHP.Environment
import IHP.FrameworkConfig
import IHP.View.CSSFramework
import IHP.HtmlSupport.QQ (hsx)
import IHP.FlashMessages.Types

customCSSFramework =
    tailwind { styledFlashMessage } 
        where styledFlashMessage _ (SuccessFlashMessage message) = [hsx|<div class="alert alert-success">{message}</div>|]


config :: ConfigBuilder
config = do
    option Development
    option (AppHostname "localhost")
    option customCSSFramework
