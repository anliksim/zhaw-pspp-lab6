Object subclass: #PIMonteCarlo
    instanceVariableNames: 'n'
    classVariableNames: ''
    package: 'PIMonteCarlo'

count: aNumber
    n := aNumber.
    ^n.

pi
    | hit rand x y |
    hit := 0.
    rand := Random new.

    1 to: n do: [ :i |
        x := rand next.
        y := rand next.

        (x squared) + (y squared) < 1
            ifTrue: [ hit := hit + 1 ].
    ].

    ^hit / n * 4 asFloat.


drawPi
    | hit rand x y m |
    hit := 0.
    rand := Random new.
    m := CanvasMorph new.

    m drawBlock: [ :c |
        1 to: n do: [ :i |
            x := rand next.
            y := rand next.

            (x squared) + (y squared) < 1
                ifTrue: [
                    hit := hit + 1.
                    c fillOval: ((x*400)@(y*400) extent: 1@1) color: Color red.
                ]
                ifFalse: [
                    c fillOval: ((x*400)@(y*400) extent: 1@1) color: Color black.
                ].
        ].
    ].

    ^m.

