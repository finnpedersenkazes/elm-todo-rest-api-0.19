module View exposing (atb, pipeDivider, siteHeader, view)

import Browser exposing (Document)
import Html exposing (..)
import Html.Attributes exposing (href, style, target)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Todos.Edit
import Todos.List



-- this is our "root" view. the entire appearance of our application
-- is derived here from the app state (model)


view : Model -> Document Msg
view model =
    { title = "bbq"
    , body =
        [ div []
            [ siteHeader

            -- render the todos edit and list sub-views using pars of the model,
            -- then "tag" outgoing messages with TodosMsg
            , Html.map TodosMsg <| Todos.Edit.view model.todoEditView
            , br [] []
            , Html.map TodosMsg <| Todos.List.view model.todos
            ]
        ]
    }


siteHeader : Html msg
siteHeader =
    header []
        [ h1 [] [ text "Elm Todos" ]
        , p []
            [ text "Built with "
            , atb "http://elm-lang.org" "Elm"
            , text " ♥"
            ]
        , p []
            [ text "Created by Andrew Suzuki"
            , pipeDivider
            , atb "https://github.com/andrewsuzuki" "github"
            , pipeDivider
            , atb "https://github.com/andrewsuzuki/elm-todomvc-with-api" "source"
            ]
        ]


pipeDivider : Html msg
pipeDivider =
    text " | "


atb : String -> String -> Html msg
atb url title =
    a
        [ href url
        , target "_blank"
        ]
        [ text title ]
