module Entries.List exposing (..)

import RemoteData exposing (WebData)
import Html exposing (..)
import Html.Attributes exposing (class, href)
import Msgs exposing (Msg)
import Models exposing (Entry)
import Routing exposing (entryPath)

view : WebData(List Entry) -> Html Msg
view response =
    div []
        [ nav
        , maybeList response
        ]


nav : Html Msg
nav =
    div [ class "clearfix mb2 white bg-black" ]
        [ div [ class "left p2" ] [ text "How can we make tech more inclusive?" ] ]


maybeList : WebData(List Entry) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Failure error ->
            text (toString error)

        RemoteData.Success entries ->
            list entries

list : List Entry -> Html Msg
list entries =
    div [ class "p2" ]
        [ table [ class "fit" ]
            [ thead []
                [ tr []
                    [ th [ class "border-bottom left-align" ] [ text "Id" ]
                    , th [ class "border-bottom left-align" ] [ text "Text" ]
                    , th [ class "border-bottom left-align" ] [ text "Score" ]
                    , th [ class "border-bottom left-align" ] [ text "Actions" ]
                    ]
                ]
            , tbody [] (List.map entryRow entries)
            ]
        ]


entryRow : Entry -> Html Msg
entryRow entry =
    tr []
        [ td [] [ text entry.id ]
        , td [] [ a [ href (entryPath entry.id) ] [ text entry.text ] ]
        , td [] [ text (toString entry.score) ]
        , td [] [ showEntryBtn entry ]
        ]

showEntryBtn : Entry -> Html Msg
showEntryBtn entry =
    let
        path =
            entryPath entry.id

    in
        a
            [ class "btn regular"
            , href path
            ]
            [ text "View" ]
