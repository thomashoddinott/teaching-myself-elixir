# https://www.youtube.com/watch?v=pTR89d1yVbk

defmodule BMP do

  def file_header(offset \\ 26) do # \\ = default
    file_type = "BM" # strings are binary in Elixir
    file_size = <<0::little-size(32)>> # <<>> = bitstrings; file_size = 0 for uncompressed files
    reserved = <<0::little-size(32)>>
    bitmap_offset = <<offset::little-size(32)>>

    file_type <> file_size <> reserved <> bitmap_offset
  end

  def example_data(width, height) do
    for row <- 1..height, into: <<>> do
      for item <- 1..width, into: <<>> do
        pixel(100 + 5*item, 2*row, 5*item + row)
      end <> padding_for(width, 24)
    end
  end

  def example_file(width \\ 32, height \\ 100, name \\ "img.bmp") do
    save(name, file_header() <> win2x_header(width, height),
          example_data(width, height))
  end

  def save(filename, header, pixels) do
    File.write!(filename, header <> pixels)
  end

  def pixel(blue, green, red) do
    <<blue::little-size(8),
      green::little-size(8),
      red::little-size(8)>>
  end

  def padding_for(width, bpp \\ 24) do
    bits_past = rem(width * bpp, 32)
    num = if bits_past > 0, do: (32 - bits_past), else: 0
    <<0::size(num)>>
  end

  def win2x_header(width, height, bits_per_pixel \\ 24) do
    size = <<12::little-size(32)>>
    w = <<width::little-size(16)>>
    h = <<height::little-size(16)>>
    planes = <<1::little-size(16)>>
    bpp = <<bits_per_pixel::little-size(16)>>

    size <> w <> h <> planes <> bpp
  end

  def win2x_palette do
    # 1). 2-bit palette
    # 2). 4-bit palette
  end

end
