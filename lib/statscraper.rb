class OverwatchStats::StatScraper

  def self.current
    self.scrape_all_stats
  end

  def self.scrape_all_stats
    doc = Nokogiri::HTML(open("http://masteroverwatch.com/heroes"))
    container = doc.css("div.table-body")
    counter = 0
    stats = []
    counter = 0
    container.css("div.table-row-content").each do |x|
          counter = counter + 1
          if counter >= 1 && counter <= 21
            hero_name = x.css("div.table-name span.table-name-block strong").text
            hero_type = x.css("div.table-name span.table-name-block small").text
            hero_winrate = x.css("div.table-winrate div.bar-outer").text
            hero_popularity = x.css("div.table-popularity div.bar-outer").text
            hero_kd = x.css("div.table-kd-ratio div.bar-outer").text
            hero_medalpergame = x.css("div.table-medals-game div.bar-outer").text
            stats << {:heroname => hero_name, :herotype => hero_type, :winrate => hero_winrate, :popularity => hero_popularity, :medalpergame => hero_medalpergame, :herokd => hero_kd}
          end
    end
    stats
  end

end
