# frozen_string_literal: true

require "dry-types"
require "dry-initializer"
require "phlex"

module Protos
  class Error < StandardError; end

  if defined?(Rails)
    require_relative "protos/engine"
  else
    require_relative "protos/version"
    require_relative "protos/types"
    require_relative "protos/component"
    require_relative "protos/theme"
    require_relative "protos/attributes"

    # Components
    require_relative "protos/accordion"
    require_relative "protos/accordion/item"

    require_relative "protos/alert"
    require_relative "protos/alert/actions"
    require_relative "protos/alert/icon"

    require_relative "protos/avatar"

    require_relative "protos/card"
    require_relative "protos/card/body"
    require_relative "protos/card/title"
    require_relative "protos/card/actions"
    require_relative "protos/card/image"

    require_relative "protos/collapse"
    require_relative "protos/collapse/title"
    require_relative "protos/collapse/content"

    require_relative "protos/combobox"

    require_relative "protos/command"
    require_relative "protos/command/input"
    require_relative "protos/command/dialog"
    require_relative "protos/command/group"
    require_relative "protos/command/list"
    require_relative "protos/command/trigger"
    require_relative "protos/command/title"
    require_relative "protos/command/item"
    require_relative "protos/command/empty"

    require_relative "protos/drawer"
    require_relative "protos/drawer/side"
    require_relative "protos/drawer/trigger"
    require_relative "protos/drawer/content"

    require_relative "protos/dropdown"
    require_relative "protos/dropdown/menu"
    require_relative "protos/dropdown/trigger"

    require_relative "protos/list"
    require_relative "protos/list/item"

    require_relative "protos/modal"
    require_relative "protos/modal/close_button"
    require_relative "protos/modal/dialog"
    require_relative "protos/modal/trigger"

    require_relative "protos/popover"
    require_relative "protos/popover/trigger"
    require_relative "protos/popover/content"

    require_relative "protos/table"
    require_relative "protos/table/caption"
    require_relative "protos/table/header"
    require_relative "protos/table/head"
    require_relative "protos/table/body"
    require_relative "protos/table/footer"
    require_relative "protos/table/row"
    require_relative "protos/table/cell"

    require_relative "protos/timeline"
    require_relative "protos/timeline/item"
    require_relative "protos/timeline/left"
    require_relative "protos/timeline/center"
    require_relative "protos/timeline/right"

    require_relative "protos/typography"
    require_relative "protos/typography/heading"
    require_relative "protos/typography/paragraph"
    require_relative "protos/typography/inline_link"
  end
end
