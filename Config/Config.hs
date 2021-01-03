module Config where

import IHP.Prelude
import IHP.Environment
import IHP.FrameworkConfig
import IHP.View.CSSFramework
import IHP.HtmlSupport.QQ (hsx)
import IHP.FlashMessages.Types


config :: ConfigBuilder
config = do
    option Development
    option (AppHostname "localhost")
    option tailwind
