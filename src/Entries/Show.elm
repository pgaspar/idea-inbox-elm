module Entries.Show exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value, href)
import Msgs exposing (Msg)
import Models exposing (Entry)


view : Entry -> Html Msg
view model =
    div []
        [ nav model
        , form model
        ]


nav : Entry -> Html Msg
nav model =
    div [ class "clearfix mb2 white bg-black p1" ]
        []


form : Entry -> Html Msg
form entry =
    div [ class "m3" ]
        [ h1 [] [ text entry.text ]
        , formVote entry
        ]


formVote : Entry -> Html Msg
formVote entry =
    div
        [ class "clearfix py1"
        ]
        [ div [ class "col col-5" ] [ text "Votes" ]
        , div [ class "col col-7" ]
            [ span [ class "h2 bold" ] [ text (toString entry.score) ]
            , btnVoteUp entry
            , btnVoteDown entry
            ]
        ]


btnVoteDown : Entry -> Html Msg
btnVoteDown entry =
    a [ class "btn ml1 h1" ]
        [ text "▼" ]


btnVoteUp : Entry -> Html Msg
btnVoteUp entry =
    a [ class "btn ml1 h1" ]
        [ text "▲" ]
