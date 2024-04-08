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

## [0.4.0] - ???

- Phlex discord didn't like all the calls to `render`
- Apparently `render` is called differently within ERB
- Suggested to change all calls to immediately render, would improve ergonomics
