defmodule StatWatch do

  def run do
    fetch_stats()
    |> save_csv
  end

  def column_names() do
    Enum.join ~w(DateTime Subscribers Videos Views), ","
  end

  def fetch_stats() do
    now = DateTime.to_string(%{DateTime.utc_now | microsecond: {0, 0}})

    %{body: body} = HTTPoison.get! stats_url(), [], hackney: [:insecure]
    # https://stackoverflow.com/a/33205109/14177413

    %{items: [%{statistics: stats} | _]} = Poison.decode!(body, keys: :atoms)
    [ now,
      stats.subscriberCount,
      stats.videoCount,
      stats.viewCount
    ] |> Enum.join(", ")
  end

  def save_csv(row_of_stats) do
    filename = "stats.csv"
    unless File.exists? filename do
      File.write! filename, column_names() <> "\n"
    end
      File.write filename, row_of_stats <> "\n", [:append]
  end

  def stats_url do
    # https://developers.google.com/youtube/v3/getting-started
    # and follow instructions to create your project api key
    youtube_api_v3 = "https://www.googleapis.com/youtube/v3/"
    channel = "id=" <> "UCgElZtdGdbYjcaACFwPO93w"
    key = "key=" <> System.get_env("YoutubeApiKey")
    "#{youtube_api_v3}channels?#{channel}&#{key}&part=statistics"
  end
end
