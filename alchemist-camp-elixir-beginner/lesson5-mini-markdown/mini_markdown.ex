defmodule MiniMarkdown do
  def to_html(text) do
    # do lots of transforms in a pipeline
    text 
      |> paragraph
      |> bold
      |> italics
  end

  def italics(text) do
    Regex.replace(~r/\*(.*)\*/, text, "<em>\\1</em>") # \1 = captured by this regex
  end

  def bold(text) do
    Regex.replace(~r/\*\*(.*)\*\*/, text, "<strong>\\1</strong>")
  end

  def paragraph(text) do
    # everything separated by a newline is a paragraph in markdown
    # /r/n - windows; /r - unix; \n - unix
    Regex.replace(~r/(\r\n|\r|\n|^)+([^\r\n]+)((\r\n|\r|\n)+$)?/, text, "<p>\\2</p>")
  end

  def test_str do 
    """
    I *so* enjoyed eating that burrito and the hot sauce was **amaaazing**

    What did you think of it?

    asdf
    """
  end
end