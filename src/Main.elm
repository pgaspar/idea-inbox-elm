module Main exposing (..)

import Msgs exposing (Msg)
import Models exposing (Model, initialModel)
import Navigation exposing (Location)
import Routing
import Update exposing (update)
import View exposing (view)
import Commands exposing (fetchEntries)



init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( initialModel currentRoute, fetchEntries )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    Navigation.program Msgs.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
