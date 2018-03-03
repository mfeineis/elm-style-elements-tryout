module Main exposing (main)

import Element exposing (Device)
import Html exposing (Html)
import Styled
import Window


type alias Model =
    { device : Device
    , who : String
    }


type Msg
    = Resize Window.Size


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }


withoutEffect : Model -> ( Model, Cmd Msg )
withoutEffect model =
    ( model, Cmd.none )


init : ( Model, Cmd Msg )
init =
    withoutEffect
        { device =
            Element.classifyDevice { width = 1280, height = 1024 }
        , who = "Style Elements"
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Window.resizes Resize
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Resize size ->
            withoutEffect
                { model
                    | device = Element.classifyDevice size
                }


view : Model -> Html Msg
view =
    Styled.view
