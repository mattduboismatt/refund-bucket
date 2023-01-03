module CreditsHelper
  def render_update_stats_stream(credits)
    turbo_stream.update "stats" do
      render "stats", credits: credits
    end
  end
end
