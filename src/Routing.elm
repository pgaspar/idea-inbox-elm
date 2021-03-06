module Routing exposing (..)

import Navigation exposing (Location)
import Models exposing (EntryId, Route(..))
import UrlParser exposing (..)

matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map EntriesRoute top
        , map EntryRoute (s "entries" </> string)
        , map EntriesRoute (s "entries")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parsePath matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


-- Path Helpers

entriesPath : String
entriesPath =
    "/entries"

entryPath : EntryId -> String
entryPath entryId =
    "/entries/" ++ entryId
