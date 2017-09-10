module View exposing (..)


import Html exposing (Html, div, text)
import Msgs exposing (Msg)
import Models exposing (Model, EntryId)
import Entries.List
import Entries.Show
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

        Models.EntryRoute id ->
            entryShowPage model id

        Models.NotFoundRoute ->
            notFoundView


entryShowPage : Model -> EntryId -> Html Msg
entryShowPage model entryId =
    case model.entries of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading ..."

        RemoteData.Success entries ->
            let
                maybeEntry =
                    entries
                        |> List.filter (\entry -> entry.id == entryId)
                        |> List.head
            in
                case maybeEntry of
                    Just entry ->
                        Entries.Show.view entry

                    Nothing ->
                        notFoundView

        RemoteData.Failure err ->
            text (toString err)


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
