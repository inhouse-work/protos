## [Unreleased]

## [0.1.0] - 2024-03-01

- Initial release

## [0.2.0] - 2024-03-06

- Chose to move away from daisyUI dropdown defaults as they have problems
  displaying properly in too many situations
- Opted for using a protos-stimulus controller that uses tippy.js

## [0.3.0] - 2024-04-06

- Updates to phlex v0.10 by changing all `template` methods to `view_template`
- Improvements to README

## [0.4.0] - 2024-04-09

- Phlex discord didn't like all the calls to `render`
- Apparently `render` is called differently within ERB
- Suggested to change all calls to immediately render, would improve ergonomics

## [0.4.2] - 2024-04-30

- Adds ability to pass arrays of tokens to themes
- Removes unnecessary calls to `tokens`, preferring arrays of strings for
  performance
- Improvements to performance with constant hash lookups and early returns on
  `mix`
- Adds steps component
