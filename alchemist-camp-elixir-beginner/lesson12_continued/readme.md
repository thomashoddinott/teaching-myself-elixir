https://www.youtube.com/watch?v=pTR89d1yVbk

```elixir
iex(9)> win2x_palette([[0,0,0],[0,127,0]])
<<0, 0, 0, 0, 127, 0>>
```

```elixir
iex(5)> example_monochrome
:ok
```

*mono.bmp*

<img src="mono.bmp" alt="mono" width=200 />

```elixir
iex(12)> example_4bit
:ok
```

*4bit.bmp*

<img src="4bit.bmp" alt="4bit" width=400 />

---

Elixir obviously isn't targeted to bitmap manipulation. It doesn't excel in CPU-bound tasks like that. But it's ease of use when working with binary data makes it perfect for applications such as binary protocols.

https://webrtc.org/, Elixir video game backends, etc.

