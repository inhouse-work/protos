# frozen_string_literal: true

RSpec.describe Protos::Mix do
  describe "#call" do
    it "handles a nil value" do
      attrs = { foo: "bar" }
      result = subject.call(attrs, nil)

      expect(result[:foo]).to eq("bar")
    end

    it "merges the mergeable attributes" do
      result = subject.call(
        {
          class: "bar",
          data: {
            controller: "something",
            list: [1, 2]
          }
        },
        {
          class: "baz",
          data: {
            controller: "other",
            list: [3]
          }
        }
      )

      expect(result[:class]).to eq("bar baz")
      expect(result[:data]).to eq(
        controller: "something other",
        list: [1, 2, 3]
      )
    end

    it "merges other attributes by replacement" do
      result = subject.call(
        {
          value: "foo",
          id: "bar",
          name: "baz"
        },
        {
          value: "bar",
          id: "baz",
          name: "foo"
        }
      )

      expect(result[:value]).to eq("bar")
      expect(result[:id]).to eq("baz")
      expect(result[:name]).to eq("foo")
    end
  end
end
