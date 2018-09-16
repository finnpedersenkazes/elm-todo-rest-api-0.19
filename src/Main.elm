module Main exposing (main)

import Browser
import Html
import Json.Decode as Decode exposing (Value)
import Messages exposing (..)
import Models exposing (Model, init)
import Subscriptions exposing (subscriptions)
import Update exposing (update)
import View exposing (view)



-- this is the entry point into our application
-- notice how there is no mention of "Todo" anywhere!
-- everything having to do with Todos is modularized and encapsulated


main : Program Value Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
