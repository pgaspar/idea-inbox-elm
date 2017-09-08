module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Msgs exposing (Msg)
import Models exposing (EntryId, Entry)
import RemoteData


fetchEntries : Cmd Msg
fetchEntries =
    Http.get fetchEntriesUrl entriesDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchEntries


fetchEntriesUrl : String
fetchEntriesUrl =
    "http://localhost:4000/entries"


entriesDecoder : Decode.Decoder (List Entry)
entriesDecoder =
    Decode.list entryDecoder


entryDecoder : Decode.Decoder Entry
entryDecoder =
    decode Entry
        |> required "id" Decode.string
        |> required "text" Decode.string
        |> required "score" Decode.int
