class OverwatchStats::CLI

  attr_accessor :stats

  def start
    greeting
    display_stats_alphabetically
    menu
  end

  def greeting
    puts "Cheers Love! Welcome to OverwatchStats!"
  end

  def menu
    puts "Type the following to change sorting rules: '(win)rate' '(pop)ularity' '(score)min' '(kd)ratio' or '(alph)abetically'"
    puts "Type 'exit' to exit."

    input = gets.strip.downcase
      if input == "winrate" || input == "win"
        display_stats_winrate
        menu
      elsif input == "popularity" || input == "pop"
        display_stats_popularity
        menu
      elsif input == "scoremin" || input == "score"
        display_stats_scoremin
        menu
      elsif input == "kdratio" || input == "kd"
        display_stats_herokd
        menu
      # elsif input == "bastion"
      #   show_bastion
      # elsif input == "d.va"
      #   show_dva
      # elsif input == "genji"
      #   show_genji
      # elsif input == "hanzo"
      #   show_hanzo
      # elsif input == "junkrat"
      #   show_junkrat
      # elsif input == "lucio"
      #   show_lucio
      # elsif input == "mccree"
      #   show_mccree
      # elsif input == "mei"
      #   show_mei
      # elsif input == "mercy"
      #   show_mercy
      # elsif input == "pharah"
      #   show_pharah
      # elsif input == "reaper"
      #   show_reaper
      # elsif input == "reinhardt"
      #   show_reinhardt
      # elsif input == "roadhog"
      #   show_roadhog
      # elsif input == "soldier76"
      #   show_soldier76
      # elsif input == "symmetra"
      #   show_symmetra
      # elsif input == "torbjorn"
      #   show_torbjorn
      # elsif input == "tracer"
      #   show_tracer
      # elsif input == "widowmaker"
      #   show_widowmaker
      # elsif input == "winston"
      #   show_winston
      # elsif input == "zarya"
      #   show_zarya
      # elsif input == "zenyatta"
      #   show_zenyatta
      elsif input == "exit"
        exit
      else
        puts "Please make a valid selection..."
        menu
      end

    end

    def display_stats_alphabetically
      stats = OverwatchStats::StatScraper.current
      puts "||   HERO    ||    TYPE    ||    WINRATE    ||    POPULARITY   ||    GAMESCORE/MINUTE    ||    Kills/Deaths"
      stats.each.with_index(1) do |herostats, index|
        puts "|| #{index}. #{herostats[:heroname]}    ||    #{herostats[:herotype]}    ||    #{herostats[:winrate]}    ||    #{herostats[:popularity]}    ||    #{herostats[:scoremin]}    || #{herostats[:herokd]}"
      end
    end

    def display_stats_winrate
      stats = OverwatchStats::StatScraper.current
      bywinrate = stats.sort_by {|hash| hash[:winrate]}.reverse
      puts "||   HERO    ||    TYPE    ||    WINRATE    ||    POPULARITY   ||    GAMESCORE/MINUTE    ||    Kills/Deaths"
      bywinrate.each.with_index(1) do |herostats, index|
        puts "|| #{index}. #{herostats[:heroname]}    ||    #{herostats[:herotype]}    ||    #{herostats[:winrate]}    ||    #{herostats[:popularity]}    ||    #{herostats[:scoremin]}    || #{herostats[:herokd]}"
      end
    end

    def display_stats_popularity
      stats = OverwatchStats::StatScraper.current
      bypopularity = stats.sort_by {|hash| hash[:popularity]}.reverse
      puts "||   HERO    ||    TYPE    ||    WINRATE    ||    POPULARITY   ||    GAMESCORE/MINUTE    ||    Kills/Deaths"
      bypopularity.each.with_index(1) do |herostats, index|
        puts "|| #{index}. #{herostats[:heroname]}    ||    #{herostats[:herotype]}    ||    #{herostats[:winrate]}    ||    #{herostats[:popularity]}    ||    #{herostats[:scoremin]}    || #{herostats[:herokd]}"
      end
    end

    def display_stats_scoremin
      stats = OverwatchStats::StatScraper.current
      byscoremin = stats.sort_by {|hash| hash[:scoremin]}.reverse
      puts "||   HERO    ||    TYPE    ||    WINRATE    ||    POPULARITY   ||    GAMESCORE/MINUTE    ||    Kills/Deaths"
      byscoremin.each.with_index(1) do |herostats, index|
        puts "|| #{index}. #{herostats[:heroname]}    ||    #{herostats[:herotype]}    ||    #{herostats[:winrate]}    ||    #{herostats[:popularity]}    ||    #{herostats[:scoremin]}    || #{herostats[:herokd]}"
      end
    end

    def display_stats_herokd
      stats = OverwatchStats::StatScraper.current
      byherokd = stats.sort_by {|hash| hash[:herokd]}.reverse
      puts "||   HERO    ||    TYPE    ||    WINRATE    ||    POPULARITY   ||    GAMESCORE/MINUTE    ||    Kills/Deaths"
      byherokd.each.with_index(1) do |herostats, index|
        puts "|| #{index}. #{herostats[:heroname]}    ||    #{herostats[:herotype]}    ||    #{herostats[:winrate]}    ||    #{herostats[:popularity]}    ||    #{herostats[:scoremin]}    || #{herostats[:herokd]}"
      end
    end

end
