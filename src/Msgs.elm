module Msgs exposing (..)

import Models exposing (Entry)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


type Msg
    = OnFetchEntries (WebData (List Entry))
    | OnLocationChange Location
