module Models exposing (..)

type alias Model =
    { entries : List Entry
    }

initialModel : Model
initialModel =
    { entries = [ Entry "1" "Test Entry" 20 ]
    }

type alias EntryId =
    String

type alias Entry =
    { id : EntryId
    , text : String
    , score : Int
    }
