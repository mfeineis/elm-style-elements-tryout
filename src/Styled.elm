module Styled exposing ( view )

import Color
import Element exposing (Device, column, el, row, text)
import Element.Attributes exposing (height, fill, padding, spacing, width)
import Html exposing (Html)
import Style
import Style.Color
import Style.Font as Font
import Style.Scale as Scale


scale =
    Scale.modular 16 1.618


type MyStyles
    = Title
    | MyRowStyle
    | MyStyle


stylesheet =
    Style.styleSheet
        [ Style.style Title
            [ Style.Color.background Color.black
            , Style.Color.text Color.darkGrey
            , Font.size (scale 1)
            ]
        , Style.style MyStyle
            [ Style.Color.background Color.blue
            , Style.Color.text Color.white
            , Font.size (scale 2)
            ]
        ]


view : { a | device : Device, who : String } -> Html msg
view { device, who } =
    let
        myLayout =
            if device.phone then
                column
            else
                row
    in
    Element.layout stylesheet <|
        myLayout MyRowStyle [ padding 10, spacing 7, width fill ]
            [ el Title [] (text ("Hello " ++ who ++ "!"))
            , el MyStyle [] (text "#1")
            , el MyStyle [] (text "#2")
            ]
