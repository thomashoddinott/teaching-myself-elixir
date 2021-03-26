defmodule BMP do

  def file_header(offset \\ 26) do # \\ = default
    file_type = "BM" # strings are binary in Elixir
    file_size = <<0::little-size(32)>> # <<>> = bitstrings; file_size = 0 for uncompressed files
    reserved = <<0::little-size(32)>>
    bitmap_offset = <<offset::little-size(32)>>

    file_type <> file_size <> reserved <> bitmap_offset
  end

  def example_data(width, height) do
    # guard: width, height must be divisible by 4

    bytes_past = rem(3 * width, 4)
    padding = if bytes_past > 0, do: (4 - bytes_past) * 8, else: 0
    for row <- 1..height, into: <<>> do
      for item <- 1..width, into: <<>> do
        <<(100 + 5 * item)::little-size(8),
          (2 * row)::little-size(8),
          (5 * item + row)::little-size(8)>>
        # <<0::size(8), 0::size(8), 255::little-size(8)>> # solid red
      end <> <<0::size(padding)>>
    end
  end

  def example_file(width \\ 32, height \\ 100, name \\ "img.bmp") do
    save(name, win2x_header(width, height), example_data(width, height))
  end

  def save(filename, header, pixels) do
    File.write!(filename, file_header() <> header <> pixels)
  end

  def win2x_header(width, height, bits_per_pixel \\ 24) do
    size = <<12::little-size(32)>>
    w = <<width::little-size(16)>>
    h = <<height::little-size(16)>>
    planes = <<1::little-size(16)>>
    bpp = <<bits_per_pixel::little-size(16)>>

    size <> w <> h <> planes <> bpp
  end

end
