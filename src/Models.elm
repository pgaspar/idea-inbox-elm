module Models exposing (..)

import RemoteData exposing (WebData)

type alias Model =
    { entries : WebData(List Entry)
    }

initialModel : Model
initialModel =
    { entries = RemoteData.Loading
    }

type alias EntryId =
    String

type alias Entry =
    { id : EntryId
    , text : String
    , score : Int
    }
