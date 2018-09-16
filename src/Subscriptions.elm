module Subscriptions exposing (subscriptions)

import Messages exposing (Msg)
import Models exposing (Model)



-- these are our "root" subscriptions,
-- but we don't need any for this application.


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- for a good intro to subscriptions, see the elm guide and its "Time" example:
-- http://guide.elm-lang.org/architecture/effects/time.html
