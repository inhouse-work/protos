# frozen_string_literal: true

module Protos
  module Types
    include Dry.Types()

    MaskShapes = Types::Coercible::Symbol.enum(
      :none,
      :squircle,
      :heart,
      :hexagon,
      :hexagon2,
      :decagon,
      :pentagon,
      :diamond,
      :square,
      :circle,
      :parallelogram,
      :parallelogram2,
      :parallelogram3,
      :parallelogram4,
      :star,
      :star2,
      :triangle,
      :triangle2,
      :triangle3,
      :triangle4,
      :half1,
      :half2
    )
  end
end
