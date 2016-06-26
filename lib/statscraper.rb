class OverwatchStats::StatScraper

  def self.current
    self.scrape_all_stats
  end

  def self.scrape_all_stats
    doc = Nokogiri::HTML(open("http://masteroverwatch.com/heroes"))
    container = doc.css("main.heroes-data div.table-list")
    counter = 0
    stats = []
    container.css("div.table-row-container").each do |x|
        counter += 1
        if counter > 1
          hero_name = x.css("div.row div.table-icon strong span").text
          hero_type = x.css("div.row div.table-icon strong small").text
          threenumbers = x.css("span.table-stats-winrate").text
            hero_winrate = threenumbers.split("%")[0] + "%"
            hero_popularity = threenumbers.split("%")[1] + "%"
            hero_scoremin = threenumbers.split("%")[2]
          hero_kd = x.css("div.table-stats-kd span").text + ":1"
          stats << {:heroname => hero_name, :herotype => hero_type, :winrate => hero_winrate, :popularity => hero_popularity, :scoremin => hero_scoremin, :herokd => hero_kd}
        end
    end
    stats
  end

end
