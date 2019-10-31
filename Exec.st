p := PiMonteCarlo new.
p count: 100000000.
p pi.

m := p drawPi.
m openInWindow.
