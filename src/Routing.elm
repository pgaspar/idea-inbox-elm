module Routing exposing (..)

import Navigation exposing (Location)
import Models exposing (EntryId, Route(..))
import UrlParser exposing (..)

matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map EntriesRoute top
        , map EntriesRoute (s "entries")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
