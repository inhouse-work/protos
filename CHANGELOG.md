## [Unreleased]

## [0.6.0] - 2024-09-04

- Changes how merging attributes works to only mix on certain attributes,
  overriding on all others. This is opposite to how attributes used to be merged
  by default. This is a fix for attributes like `value` where you actually need
  to override them.
- Adds a separate tested `Mix` class for handling attribute merging

## [0.5.0] - 2024-08-27

- Fixes all accessibility violations according to Axe Core
- Reduces responsibility of Tabs to only be a tablist, no tab panels
- Fixes passing ID to popovers, dropdowns, drawers, etc to not override the
  input ID
- Changes trigger on popover to be a button instead of a div

## [0.4.3] - 2024-08-14

- Removes unneeded auto-loading in Rails which fixes collisions with `protos-markdown`
- Adds fixes for handling form submissions within modals with `protos-stimulus`
  v0.0.3
- Adds ability to disable margin on p tags with `Protos::Typography`

## [0.4.2] - 2024-04-30

- Adds ability to pass arrays of tokens to themes
- Removes unnecessary calls to `tokens`, preferring arrays of strings for
  performance
- Improvements to performance with constant hash lookups and early returns on
  `mix`
- Adds steps component

## [0.4.0] - 2024-04-09

- Phlex discord didn't like all the calls to `render`
- Apparently `render` is called differently within ERB
- Suggested to change all calls to immediately render, would improve ergonomics

## [0.3.0] - 2024-04-06

- Updates to phlex v0.10 by changing all `template` methods to `view_template`
- Improvements to README

## [0.2.0] - 2024-03-06

- Chose to move away from daisyUI dropdown defaults as they have problems
  displaying properly in too many situations
- Opted for using a protos-stimulus controller that uses tippy.js

## [0.1.0] - 2024-03-01

- Initial release
