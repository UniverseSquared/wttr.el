# wttr.el

wttr.el is an emacs client for [wttr.in](http://wttr.in).

## Installation

To install, place wttr.el somewhere into your emacs `load-path`, and require `wttr` in your emacs configuration.

## Usage

To get the weather in a city, do `M-x wttr RET`. To get the moon phase, do `M-x wttr-moon RET`.

## Configuration

The following configuration variables are available:

* `wttr-city-names`: a list of city names (default value `'("London" "Milton Keynes" "Paris")`)
