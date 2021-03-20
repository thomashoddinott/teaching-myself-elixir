defmodule AlchemyMarkdownTest do
  use ExUnit.Case
  doctest AlchemyMarkdown

  test "italiceizes" do
    str = "Something *important*"
    assert AlchemyMarkdown.to_html(str) =~ 
      "Something <em>important</em>"
      # =~ <right side> substring in <left side>
  end

  test "expands big tags" do
    str = "Some ++big++ words!"
    assert AlchemyMarkdown.to_html(str) =~
      "<big>big</big> words!"
  end

  test "expands small tags" do
    str = "Some --small-- words!"
    assert AlchemyMarkdown.to_html(str) =~
      "<small>small</small> words!"
  end

  test "expands hr tags" do
    str1 = "Stuff over the line\n---"
    str2 = "Stuff over the line\n***"
    str3 = "Stuff over the line\n- - -"
    str4 = "Stuff over the line\n*   *   *"
    str5 = "Stuff over the line*   *   *"

    Enum.each([str1, str2, str3, str4], fn str ->
      assert AlchemyMarkdown.hrs(str)
      == "Stuff over the line\n<hr />"
    end)

    assert AlchemyMarkdown.hrs(str5) == str5
  end

end
