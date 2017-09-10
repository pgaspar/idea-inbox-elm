module View exposing (..)


import Html exposing (Html, div, text)
import Msgs exposing (Msg)
import Models exposing (Model, EntryId)
import Entries.List
import RemoteData


view : Model -> Html Msg
view model =
    div []
        [ page model ]

page : Model -> Html Msg
page model =
    case model.route of
        Models.EntriesRoute ->
            Entries.List.view model.entries

        Models.NotFoundRoute ->
            notFoundView


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
