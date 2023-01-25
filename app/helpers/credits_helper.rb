module CreditsHelper
  def render_update_stats_stream(stats)
    turbo_stream.update "stats" do
      render "stats", stats: stats
    end
  end

  def sort_link_to(name, column)
    name = raw("#{name} #{direction_indicator(column)}")

    params = request.params.
      merge(sort: column, direction: next_direction(column))

    link_to name, params, data: {
      turbo_action: "advance",
      action: "turbo:click->sort-link#updateForm"
    }
  end

  def next_direction(column)
    if currently_sorted?(column)
      params[:direction] == "asc" ? "desc" : "asc"
    else
      "asc"
    end
  end

  def direction_indicator(column)
    if currently_sorted?(column)
      tag.span(class: "sort sort-#{next_direction(column)}")
    end
  end

  def currently_sorted?(column)
    params[:sort] == column.to_s
  end
end
