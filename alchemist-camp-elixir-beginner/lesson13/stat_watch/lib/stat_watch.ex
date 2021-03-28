defmodule StatWatch do

  def run do
    fetch_stats("UC77UtoyivVHkpApL0wGfH5w", "https://twitter.com/")
    |> save_csv
  end

  def column_names() do
    Enum.join ~w(DateTime Subscribers Videos Views, AlexaRank), ","
  end

  def fetch_stats(channel_id, url) do
    now = DateTime.to_string(%{DateTime.utc_now | microsecond: {0, 0}})

    %{body: body} = HTTPoison.get! "data.alexa.com/data?cli=10&url=#{url}", [], hackney: [:insecure]
    alexa = body |> SweetXml.xpath(~s"//POPULARITY/@TEXT") || "unranked"

    %{body: body} = HTTPoison.get! stats_url(channel_id), [], hackney: [:insecure]

    %{items: [%{statistics: stats} | _]} = Poison.decode!(body, keys: :atoms)
    [ now,
      stats.subscriberCount,
      stats.videoCount,
      stats.viewCount,
      alexa
    ] |> Enum.join(", ")
  end

  def save_csv(row_of_stats, name \\ ["stats"]) do
    filename = "stats/#{name}.csv"
    unless File.exists? filename do
      File.write! filename, column_names() <> "\n"
    end
      File.write filename, row_of_stats <> "\n", [:append]
  end

  def stats_url(channel_id) do
    youtube_api = "https://www.googleapis.com/youtube/v3/"
    key = "key=" <> System.get_env("YoutubeApiKey")
    "#{youtube_api}channels?id=#{channel_id}$#{key}&part=statistics,snippet"
  end
end
