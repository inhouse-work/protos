# frozen_string_literal: true

RSpec.describe Protos::Theme::Fast do
  it "resolves a string value" do
    theme = described_class.new({ foo: "bar" })

    expect(theme[:foo]).to eq("bar")
  end

  it "joins an array of values" do
    theme = described_class.new({ foo: ["bar", nil, "baz"] })

    expect(theme[:foo]).to eq("bar baz")
  end

  it "merges conflicting classes with tailwind-merge" do
    theme = described_class.new({ foo: "p-2 p-4" })

    expect(theme[:foo]).to eq("p-4")
  end

  it "handles multiple keys" do
    theme = described_class.new({ foo: "bar", baz: "qux" })

    expect(theme[:foo, :baz]).to eq("bar qux")
  end

  it "allows adding additional string styles" do
    theme = described_class.new({ foo: "bar" })

    expect(theme[:foo, "baz"]).to eq("bar baz")
  end

  it "returns nil for missing keys" do
    theme = described_class.new({})

    expect(theme[:foo]).to be_nil
  end

  it "returns nil for empty values" do
    theme = described_class.new({ foo: "" })

    expect(theme[:foo]).to be_nil
  end
end
