module Models exposing (..)

import RemoteData exposing (WebData)

type alias Model =
    { entries : WebData(List Entry)
    , route : Route
    }

initialModel : Route -> Model
initialModel route =
    { entries = RemoteData.Loading
    , route = route
    }

-- Entry Resource

type alias EntryId =
    String

type alias Entry =
    { id : EntryId
    , text : String
    , score : Int
    }

-- Routes

type Route
    = EntriesRoute
    | EntryRoute EntryId
    | NotFoundRoute
