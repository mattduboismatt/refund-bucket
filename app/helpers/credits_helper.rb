module CreditsHelper
  def render_update_stats_stream(stats)
    turbo_stream.update "stats" do
      render "stats", stats: stats
    end
  end
end
