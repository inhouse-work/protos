# frozen_string_literal: true

require "json"
require "dry-types"
require "dry-initializer"
require "phlex"
require "tailwind_merge"

module Protos
  class Error < StandardError; end

  autoload :Version, "protos/version"
  autoload :Types, "protos/types"
  autoload :TokenList, "protos/token_list"
  autoload :Component, "protos/component"
  autoload :Theme, "protos/theme"
  autoload :Mix, "protos/mix"
  autoload :Attributes, "protos/attributes"
  autoload :TailwindMerge, "protos/tailwind_merge"

  # Components
  autoload :Accordion, "protos/accordion"
  autoload :Alert, "protos/alert"
  autoload :Avatar, "protos/avatar"
  autoload :Badge, "protos/badge"
  autoload :Breadcrumbs, "protos/breadcrumbs"
  autoload :Card, "protos/card"
  autoload :Carousel, "protos/carousel"
  autoload :ChatBubble, "protos/chat_bubble"
  autoload :Collapse, "protos/collapse"
  autoload :Command, "protos/command"
  autoload :Diff, "protos/diff"
  autoload :Drawer, "protos/drawer"
  autoload :Hero, "protos/hero"
  autoload :List, "protos/list"
  autoload :Menu, "protos/menu"
  autoload :Modal, "protos/modal"
  autoload :Popover, "protos/popover"
  autoload :Stats, "protos/stats"
  autoload :Steps, "protos/steps"
  autoload :Status, "protos/status"
  autoload :Swap, "protos/swap"
  autoload :Tabs, "protos/tabs"
  autoload :Table, "protos/table"
  autoload :Toast, "protos/toast"
  autoload :Timeline, "protos/timeline"
  autoload :Typography, "protos/typography"

  # Dependent
  autoload :Dropdown, "protos/dropdown"
  autoload :Combobox, "protos/combobox"
end

require_relative "protos/engine" if defined?(Rails)
