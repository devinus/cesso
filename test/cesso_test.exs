defmodule CessoTest do
  use ExUnit.Case
  alias CSV, as: C
  import Enum, only: [to_list: 1]

  test "decodes with columns" do
    res = C.decode(~s<lol,wut>, columns: [:a, :b]) |> Enum.at(0)

    assert res[:a] == "lol"
    assert res[:b] == "wut"
  end

  test "decodes with header column" do
    res = C.decode(~s<a,b\nlol,wut>, columns: true) |> Enum.at(0)

    assert res["a"] == "lol"
    assert res["b"] == "wut"
  end
end
