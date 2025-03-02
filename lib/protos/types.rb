# frozen_string_literal: true

module Protos
  module Types
    include Dry.Types()

    Styles = Types::Coercible::Symbol.enum(
      :default,
      :primary,
      :secondary,
      :accent,
      :info,
      :success,
      :warning,
      :error
    )
  end
end
