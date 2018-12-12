module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Html, br, button, div, text)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    String


init : Model
init =
    ""



--"Click to see me!" ** default text as place holder so buttons will not move
-- UPDATE


type Msg
    = Show
    | Hide
    | Told
    | Supposed


update : Msg -> Model -> Model
update msg myMessage =
    case msg of
        Show ->
            "I'm here"

        --"I'm hidden" ** use test in stead of hide the text which moves the Show and Hide buttons up **
        -- tried to use br but needs to change to union type, for Msg definition
        -- and that needs to rewrite the code again.. will try tomorrow
        Hide ->
            ""

        Told ->
            "I told you - I'm here"

        Supposed ->
            "I suppose to be hidden"



-- VIEW
-- if show button pressed change text to I'm here
-- if hide button pressed change text to "blank" --- not able to get this as not able to use br


view : Model -> Html Msg
view myMessage =
    if myMessage == "I'm here" then
        -- if msg is alrady shown
        div []
            [ div [] [ text myMessage ]
            , button [ onClick Told ] [ text "Show" ]
            , button [ onClick Hide ] [ text "Hide" ]
            ]

    else if myMessage == "" then
        -- if msg is alrady hidden
        --else if myMessage == "I'm hidden" then --- use test in stead of hide the text which moves the button up **
        div []
            [ div [] [ text myMessage ]
            , button [ onClick Show ] [ text "Show" ]
            , button [ onClick Supposed ] [ text "Hide" ]
            ]

    else
        -- -- if msg is any state
        div []
            [ div [] [ text myMessage ]
            , button [ onClick Show ] [ text "Show" ]
            , button [ onClick Hide ] [ text "Hide" ]
            ]
