https://www.youtube.com/watch?v=9o5bDiCiJ90

Learning about Elixir's binary processing capabilities with bitmap files.

https://www.fileformat.info/format/bmp/egff.htm

Bitmaps structure:

- 1.x: {File Header | Bitmap Data} 

- 2.x, 3.x, 4.x: {File Header | *Bitmap Header* | *Color Palette* | Bitmap Data}

Can skip *Color Palette* if using 24-bit encoding (?).

Bitmaps are usually uncompressed.

2.x: 

```
typedef struct _WinBMPFileHeader
{
	WORD   FileType;     /* File type, always 4D42h ("BM") */
	DWORD  FileSize;     /* Size of the file in bytes */
	WORD   Reserved1;    /* Always 0 */
	WORD   Reserved2;    /* Always 0 */
	DWORD  BitmapOffset; /* Starting position of image data in bytes */
} WINBMPFILEHEADER;
```

---

```elixir
iex(7)> BMP.file_header
<<66, 77, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0>>
iex(8)> BMP.file_header |> String.length
14
```

```elixir
iex(11)> BMP.win2x_header(5, 5) 
<<12, 0, 0, 0, 5, 0, 5, 0, 1, 0, 24, 0>>
iex(12)> BMP.win2x_header(5, 5) |> String.length
12
```

```elixir
iex(14)> BMP.example_data 32, 100
<<105, 2, 6, 110, 2, 11, 115, 2, 16, 120, 2, 21, 125, 2, 26, 130, 2, 31, 135, 2,
  36, 140, 2, 41, 145, 2, 46, 150, 2, 51, 155, 2, 56, 160, 2, 61, 165, 
2, 66,
  170, 2, 71, 175, 2, 76, 180, 2, 81, 185, 2, ...>>
```

https://marketplace.visualstudio.com/items?itemName=slevesque.vscode-hexdump - helpful extension

```elixir
iex(46)> example_file
:ok
```

<img src="img1.bmp" alt="img1" width=100 />

```elixir
iex(47)> example_file 7, 10  
:ok
```

<img src="img.bmp" alt="img" width=200 />

In other programming langs, we'd need libraries to do all of this. In Elixir working with binary data is straightforward!

---

**Challenge: throw in a colour palette:**

```elixir
def win2x_palette do
	# 1). 2-bit palette
	# 2). 4-bit palette
end
```

