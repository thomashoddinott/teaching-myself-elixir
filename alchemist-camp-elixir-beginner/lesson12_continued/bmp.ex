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

  def example_monochrome(width \\ 500, height \\ 500, name \\ "mono.bmp") do
    header = file_header(26 + 3*2) <> win2x_header(width, height, 1)
    palette = win2x_palette([[255,0,128], [127, 255, 127]])
    data = for row <- 1..height, into: <<>> do
      cols = for col <- 1..width, into: <<>> do
        <<(if row*row + col*col > 100000, do: 1, else: 0)::size(1)>>
      end
      <<cols::bitstring, padding_for(width, 1)::bitstring>>
    end
    File.write!(name, header <> palette <> data)
  end

  def example_4bit(width \\ 400, height \\ 100, name \\ "4bit.bmp") do
    header = file_header(26 + 3*16) <> win2x_header(width, height, 4)
    colors = [[255,0,0], [0,255,0], [0,0,255], [255,255,0], [255,0,255], [0,255,255],
              [255,255,255], [0,0,0], [128,0,0], [0,128,0], [0,0,128], [128,128,128],
              [255,255,128], [255,128,255], [128,255,255], [255,0,128]]
    palette = win2x_palette(colors)
    data = for row <- 1..height, into: <<>> do
      cols = for col <- 1..width, into: <<>> do
        <<rem(div(col-1, 25), 16)::size(4)>>
      end
      <<cols::bitstring, padding_for(width, 4)::bitstring>>
    end
    File.write!(name, header <> palette <> data)
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

  def win2x_palette(colors) do
    Enum.into(colors, <<>>, &(apply(BMP, :pixel, &1))) # apply high-order fn
    # [[0,0,0],[255,255,255]]
  end

end
