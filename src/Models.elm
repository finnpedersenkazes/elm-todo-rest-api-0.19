module Models exposing (Model, init)

-- notice how we can import the sub-types of a union type
-- if we wanted to just import them all, we could use (..)
-- but i think it's usually better to be explicit about imports
-- unless you truly need everything (like in Todos.Update)

import Messages exposing (Msg(..))
import Todos.Commands
import Todos.Models exposing (Todo, TodoEditView(..))



-- this is our "root" model
-- all app state is stored in this record


type alias Model =
    { todos : List Todo -- the actual list of Todos
    , todoEditView : TodoEditView
    }



-- see Todos.Models.TodoEditView
-- this is the initial state for the application
-- this is supplied to Html.App.Program in Main


init : flags -> ( Model, Cmd Msg )
init fs =
    let
        -- type aliases can be used as functions, with the arguments
        -- being in the same order they were declared in (above).
        -- here we're creating the initial model with an empty list of Todos
        -- and the "None" state for the todoEditView
        model =
            Model [] None

        -- ...instead we could have done:
        -- model = { todos = [], todoEditView = None }
        -- on initial load, we can use Cmd.batch to return a list
        -- of commands as a single command.
        -- here it's not really necessary since we only have one command
        cmds =
            Cmd.batch
                -- create a single command to fetch todos from api,
                -- mapping it with the "root" Messages.Msg.TodosMsg
                [ Cmd.map TodosMsg Todos.Commands.fetchAll ]
    in
    ( model, cmds )
