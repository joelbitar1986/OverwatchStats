class OverwatchStats::StatScraper

  def self.current
    self.scrape_all_stats
  end

  def self.scrape_all_stats
    doc = Nokogiri::HTML(open("http://masteroverwatch.com/heroes"))
    container = doc.css("main.heroes-data")
    stats = []
    counter = 0
    container.css("div.table-row-content").each do |x|
        counter += 1
        if counter > 1
          hero_name = x.css("div.table-name span strong").text
          hero_type = x.css("div.table-name span small").text
          hero_popularity = x.css("div.table-popularity div.bar-outer").text
          hero_winrate = x.css("div.table-winrate div.bar-outer").text
          hero_kd = x.css("div.table-kd-ratio div.bar-outer").text
          hero_medalmin = x.css("div.table-medals-game div.bar-outer").text
          stats << {:heroname => hero_name, :herotype => hero_type, :winrate => hero_winrate, :popularity => hero_popularity, :medalmin => hero_medalmin, :herokd => hero_kd}
        end
    end
    stats
  end

end
