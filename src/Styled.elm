module Styled exposing ( view )

import Color
import Element exposing (Device, Element, column, el, fill, height, padding, row, spacing, text, width)
import Element.Background as Background
import Element.Font as Font
import Html exposing (Html)


scaled : Int -> Int
scaled =
    Element.modular 16 1.618 >> round


myText : String -> Element msg
myText label =
    el
        [ Background.color Color.blue
        , Font.color Color.white
        , Font.size (scaled 2)
        ]
        (text label)


myTitle : String -> Element msg
myTitle label =
    el
        [ Background.color Color.black
        , Font.color Color.darkGrey
        , Font.size (scaled 1)
        ]
        (text label)


view : { a | device : Device, who : String } -> Html msg
view { device, who } =
    let
        myLayout =
            if device.phone then
                column
            else
                row
    in
    Element.layout [] <|
        myLayout [ padding 10, spacing 7, width fill ]
            [ myTitle ("Hello " ++ who ++ "!")
            , myText "#1"
            , myText "#2"
            ]
