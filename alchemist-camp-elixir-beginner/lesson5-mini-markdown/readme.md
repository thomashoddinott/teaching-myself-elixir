https://www.youtube.com/watch?v=k6GDe9ThWqI

```powershell
iex(34)> test_str
"I *so* enjoyed eating that burrito and the hot sauce was **amaaazing**\n\nWhat did you think of it?\n\nasdf\n"
iex(35)> output = test_str |> to_html
"<p>I <em>so</em> enjoyed eating that burrito and the hot sauce was <strong>amaaazing</strong></p><p>What did you think of it?</p><p>asdf</p>"
iex(36)> File.write("out.html", output)
:ok
```

[out.html](./out.html)