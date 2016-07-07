class OverwatchStats::CLI

  attr_accessor :stats

  def start
    greeting
    display_stats_alphabetically
    menu
  end

  def greeting
    puts ""
    puts "                   Cheers Love! Welcome to OverwatchStats!"
  end

  def menu
    puts "Type the following to change sorting rules: '(win)rate' '(pop)ularity' 'medal(game)' '(kd)ratio' or '(alph)abetically'."
    puts "Type the name of one of the above heroes to see more about that hero."
    puts "Type 'exit' to exit."

    input = gets.strip.downcase
      if input == "winrate" || input == "win"
        display_stats_winrate
        menu
      elsif input == "popularity" || input == "pop"
        display_stats_popularity
        menu
      elsif input == "medalpergame" || input == "medal"
        display_stats_medalpergame
        menu
      elsif input == "kdratio" || input == "kd"
        display_stats_herokd
        menu
      elsif input == "alphabetically" || input == "alph"
        display_stats_alphabetically
        menu
      elsif input == "bastion"
        display_bastion
        menu
      elsif input == "d.va"
        display_dva
        menu
      elsif input == "genji"
        display_genji
        menu
      elsif input == "hanzo"
        display_hanzo
        menu
      elsif input == "junkrat"
        display_junkrat
        menu
      elsif input == "lucio"
        display_lucio
        menu
      elsif input == "mccree"
        display_mccree
        menu
      elsif input == "mei"
        display_mei
        menu
      elsif input == "mercy"
        display_mercy
        menu
      elsif input == "pharah"
        display_pharah
        menu
      elsif input == "reaper"
        display_reaper
        menu
      elsif input == "reinhardt"
        display_reinhardt
        menu
      elsif input == "roadhog"
        display_roadhog
        menu
      elsif input == "soldier76" || input == "soldier:76" || input == "soldier: 76"
        display_soldier76
        menu
      elsif input == "symmetra"
        display_symmetra
        menu
      elsif input == "torbjorn"
        display_torbjorn
        menu
      elsif input == "tracer"
        display_tracer
        menu
      elsif input == "widowmaker"
        display_widowmaker
        menu
      elsif input == "winston"
        display_winston
        menu
      elsif input == "zarya"
        display_zarya
        menu
      elsif input == "zenyatta"
        display_zenyatta
        menu
      elsif input == "exit"
        exit
      else
        puts "Please make a valid selection..."
        menu
      end

    end

    def display_stats_alphabetically
      stats = OverwatchStats::StatScraper.current
      byalph = stats.sort_by {|hash| hash[:heroname]}
      puts ""
      puts "                        Stats Sorted Alphabetically"
      puts "==================================================================================="
      puts "||       HERO      ||   TYPE  || WINRATE || POPULARITY || MEDALS/GM || K/D Ratio ||"
      byalph.each.with_index(1) do |herostats, index|
        show_heroname = check_width(herostats[:heroname], index)
        show_herotype = check_width(herostats[:herotype], 1 , 8)
        show_winrate = check_width(herostats[:winrate], 1 , 7)
        show_popularity = check_width(herostats[:popularity], 1 , 8)
        show_medalpergame = check_width(herostats[:medalpergame], 1 , 8)
        show_herokd = check_width(herostats[:herokd], 1 , 8)
        puts "|| #{index}. #{show_heroname} || #{show_herotype} ||  #{show_winrate} ||    #{show_popularity} ||   #{show_medalpergame} ||   #{show_herokd} ||"
      end
      puts "==================================================================================="
    end

    def display_stats_winrate
      stats = OverwatchStats::StatScraper.current
      bywinrate = stats.sort_by {|hash| hash[:winrate]}.reverse
      puts "                          Stats Sorted by Winrate"
      puts "==================================================================================="
      puts "||       HERO      ||   TYPE  || WINRATE || POPULARITY || MEDALS/GM || K/D Ratio ||"
      bywinrate.each.with_index(1) do |herostats, index|
        show_heroname = check_width(herostats[:heroname], index)
        show_herotype = check_width(herostats[:herotype], 1 , 8)
        show_winrate = check_width(herostats[:winrate], 1 , 7)
        show_popularity = check_width(herostats[:popularity], 1 , 8)
        show_medalpergame = check_width(herostats[:medalpergame], 1 , 8)
        show_herokd = check_width(herostats[:herokd], 1 , 8)
        puts "|| #{index}. #{show_heroname} || #{show_herotype} ||  #{show_winrate} ||    #{show_popularity} ||   #{show_medalpergame} ||   #{show_herokd} ||"
      end
      puts "==================================================================================="
    end

    def display_stats_popularity
      stats = OverwatchStats::StatScraper.current
      bypopularity = stats.sort_by {|hash| hash[:popularity]}.reverse
      puts "                         Stats Sorted by Popularity"
      puts "==================================================================================="
      puts "||       HERO      ||   TYPE  || WINRATE || POPULARITY || MEDALS/GM || K/D Ratio ||"
      bypopularity.each.with_index(1) do |herostats, index|
        show_heroname = check_width(herostats[:heroname], index)
        show_herotype = check_width(herostats[:herotype], 1 , 8)
        show_winrate = check_width(herostats[:winrate], 1 , 7)
        show_popularity = check_width(herostats[:popularity], 1 , 8)
        show_medalpergame = check_width(herostats[:medalpergame], 1 , 8)
        show_herokd = check_width(herostats[:herokd], 1 , 8)
        puts "|| #{index}. #{show_heroname} || #{show_herotype} ||  #{show_winrate} ||    #{show_popularity} ||   #{show_medalpergame} ||   #{show_herokd} ||"
      end
      puts "==================================================================================="
    end

    def display_stats_medalpergame
      stats = OverwatchStats::StatScraper.current
      bymedalpergame = stats.sort_by {|hash| hash[:medalpergame].to_f}.reverse
      puts "                        Stats Sorted by Medal/Game"
      puts "==================================================================================="
      puts "||       HERO      ||   TYPE  || WINRATE || POPULARITY || MEDALS/GM || K/D Ratio ||"
      bymedalpergame.each.with_index(1) do |herostats, index|
        show_heroname = check_width(herostats[:heroname], index)
        show_herotype = check_width(herostats[:herotype], 1 , 8)
        show_winrate = check_width(herostats[:winrate], 1 , 7)
        show_popularity = check_width(herostats[:popularity], 1 , 8)
        show_medalpergame = check_width(herostats[:medalpergame], 1 , 8)
        show_herokd = check_width(herostats[:herokd], 1 , 8)
        puts "|| #{index}. #{show_heroname} || #{show_herotype} ||  #{show_winrate} ||    #{show_popularity} ||   #{show_medalpergame} ||   #{show_herokd} ||"
      end
      puts "==================================================================================="
    end

    def display_stats_herokd
      stats = OverwatchStats::StatScraper.current
      byherokd = stats.sort_by {|hash| hash[:herokd].to_f}.reverse
      puts "                             Stats Sorted by Herokd"
      puts "==================================================================================="
      puts "||       HERO      ||   TYPE  || WINRATE || POPULARITY || MEDALS/GM || K/D Ratio ||"
      byherokd.each.with_index(1) do |herostats, index|
        show_heroname = check_width(herostats[:heroname], index)
        show_herotype = check_width(herostats[:herotype], 1 , 8)
        show_winrate = check_width(herostats[:winrate], 1 , 7)
        show_popularity = check_width(herostats[:popularity], 1 , 8)
        show_medalpergame = check_width(herostats[:medalpergame], 1 , 8)
        show_herokd = check_width(herostats[:herokd], 1 , 8)
        puts "|| #{index}. #{show_heroname} || #{show_herotype} ||  #{show_winrate} ||    #{show_popularity} ||   #{show_medalpergame} ||   #{show_herokd} ||"
      end
      puts "==================================================================================="
    end

    def check_width(string, index = 1, column_width = 13)
      if index < 10 && string.size <= column_width
        add_space = column_width - string.size - 1
        add_space.times do
          string = string + " "
        end
        string
      elsif index > 9 && string.size <= column_width
        add_space = column_width - string.size - 2
        add_space.times do
          string = string + " "
        end
      end
      string
    end

    # def display_bastion
    #   array = OverwatchStats::Hero.hero_collect
    #   array.each do |x|
    #     if x.name.downcase == "bastion"
    #       puts "Name: #{x.name}"
    #       puts "Role: #{x.role}"
    #       puts ""
    #       puts "Lore: #{x.lore}"
    #       puts ""
    #       puts "Max HP: #{x.hp}" unless x.hp == nil
    #       puts "Ammo: #{x.ammo}" unless x.ammo == nil
    #       puts ""
    #       puts "**Abilities**"
    #       puts "------------------------"
    #       x.abilities.each do |ability|
    #         puts "Ability: #{ability[:ability_name]}"
    #         puts "Description: " + "#{ability[:ability_description]}"
    #         puts ""
    #       end
    #     else
    #       menu
    #     end
    #   end
    # end



    def display_bastion
      x = OverwatchStats::Hero.bastion
      show_stats(x)
    end

    def display_dva
      x = OverwatchStats::Hero.dva
      show_stats(x)
    end

    def display_genji
      x = OverwatchStats::Hero.genji
      show_stats(x)
    end

    def display_hanzo
      x = OverwatchStats::Hero.hanzo
      show_stats(x)
    end

    def display_junkrat
      x = OverwatchStats::Hero.junkrat
      show_stats(x)
    end

    def display_lucio
      x = OverwatchStats::Hero.lucio
      show_stats(x)
    end

    def display_mccree
      x = OverwatchStats::Hero.mccree
      show_stats(x)
    end

    def display_mei
      x = OverwatchStats::Hero.mei
      show_stats(x)
    end

    def display_pharah
      x = OverwatchStats::Hero.pharah
      show_stats(x)
    end

    def display_reaper
      x = OverwatchStats::Hero.reaper
      show_stats(x)
    end

    def display_reinhardt
      x = OverwatchStats::Hero.reinhardt
      show_stats(x)
    end

    def display_roadhog
      x = OverwatchStats::Hero.roadhog
      show_stats(x)
    end

    def display_soldier76
      x = OverwatchStats::Hero.soldier76
      show_stats(x)
    end

    def display_symmetra
      x = OverwatchStats::Hero.symmetra
      show_stats(x)
    end

    def display_torbjorn
      x = OverwatchStats::Hero.torbjorn
      show_stats(x)
    end

    def display_tracer
      x = OverwatchStats::Hero.tracer
      show_stats(x)
    end

    def display_widowmaker
      x = OverwatchStats::Hero.widowmaker
      show_stats(x)
    end

    def display_winston
      x = OverwatchStats::Hero.winston
      show_stats(x)
    end

    def display_zarya
      x = OverwatchStats::Hero.zarya
      show_stats(x)
    end

    def display_zenyatta
      x = OverwatchStats::Hero.zenyatta
      show_stats(x)
    end

    def show_stats(x)
      puts "Name: #{x.name}"
      puts ""
      puts "Role: #{x.role}"
      puts "Max HP: #{x.hp}" unless x.hp == nil
      puts "Ammo: #{x.ammo}" unless x.ammo == nil
      puts ""
      puts "Lore: #{x.lore}"
      puts ""
      puts ""
      puts "**Abilities**"
      puts "------------------------"
      x.abilities.each do |ability|
        puts "Ability: #{ability[:ability_name]}"
        puts "Description: " + "#{ability[:ability_description]}"
        puts ""
      end
    end

end
