## [Unreleased]

## [1.0.1] - 2025-03-01

- Fixes a bug with inherited classes not finding their defined keys

## [1.0.0] - 2025-03-01

- Adds `Protos::Status` component
- Adds `Protos::Diff` component
- Adds `Protos::Menu` component
- Adds `state` and `icon` options to `Protos::Collapse`
- Changes `dash` option to `dashed` on `Protos::Card`
- Adds `dashed` and `soft` to `Protos::Badge`
- Adds `xl` size to `Protos::Badge`
- Updates to Phlex `v2`
- Updates to new DaisyUI `v5.0` styles
- Performance improvements to `Protos::Theme`
- Removes redefining `default_attrs` and `theme` methods. Didn't want the
  overhead of this completely unused feature. This removes `dry-core` as
  a dependency

## [0.7.0] - 2025-01-13

- Changes passing an `input_id` to accordions. Replaced with the more accurate
  `input_name` (optional) parameter. There was no point in having different
  name attributes for the different radio buttons
- Updates modal component to use newer modal controller from protos-stimulus
  that uses `@stimulus-components/dialog`
- Adds the ability for `css` helper to take multiple values, including inline
  values instead of theme keys.
- Adds new `Protos::Badge` component
- Removes deprecated tokens to prepare for phlex 2.0
- Removes `dry-initializer` undefined constant to improve performance
- Adds autoloading constants instead of hard requires

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
