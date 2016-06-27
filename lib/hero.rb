#OverwatchStats::Hero.scrapehero
class OverwatchStats::Hero

  attr_accessor :name, :lore, :hp, :ammo, :abilities, :role

  @@all = []

  # @@urls = ["http://masteroverwatch.com/heroes/15-bastion",
  # "http://masteroverwatch.com/heroes/22-d-va",
  # "http://masteroverwatch.com/heroes/21-genji",
  # "http://masteroverwatch.com/heroes/16-hanzo",
  # "http://masteroverwatch.com/heroes/2-junkrat",
  # "http://masteroverwatch.com/heroes/3-lucio",
  # "http://masteroverwatch.com/heroes/6-mccree",
  # "http://masteroverwatch.com/heroes/20-mei",
  # "http://masteroverwatch.com/heroes/17-mercy",
  # "http://masteroverwatch.com/heroes/11-pharah",
  # "http://masteroverwatch.com/heroes/8-reaper",
  # "http://masteroverwatch.com/heroes/12-reinhardt",
  # "http://masteroverwatch.com/heroes/1-roadhog",
  # "http://masteroverwatch.com/heroes/4-soldier-76",
  # "http://masteroverwatch.com/heroes/13-symmetra",
  # "http://masteroverwatch.com/heroes/14-torbjorn",
  # "http://masteroverwatch.com/heroes/7-tracer",
  # "http://masteroverwatch.com/heroes/9-widowmaker",
  # "http://masteroverwatch.com/heroes/10-winston",
  # "http://masteroverwatch.com/heroes/5-zarya",
  # "http://masteroverwatch.com/heroes/18-zenyatta"]

  def self.scrapehero(page_url)
    doc = Nokogiri::HTML(open(page_url))
    x = OverwatchStats::Hero.new
    x.name = doc.css("div.heroes-header-title h1").text
    x.lore = doc.css("div.heroes-lore p").text.gsub(".",". ")
    x.hp = doc.css("div.heroes-header-title span.stat-hp").text.strip + " HP" unless doc.css("div.heroes-header-title span.stat-hp").text.strip == ""
    x.ammo = doc.css("div.heroes-header-title span.stat-ammo").text.strip + " Ammo" unless doc.css("div.heroes-header-title span.stat-ammo").text.strip == ""
    x.abilities = []
    doc.css("div.heroes-abilities-ability").each do |ability|
      ability_name = ability.css("div.ability-name").text
      ability_description = ability.css("div.ability-description").text
      x.abilities << {:ability_name => ability_name, :ability_description => ability_description}
    end
    x.role = doc.css("div.heroes-header-title span.stat-role").text
    x
  end

  def self.bastion
    bastion = self.scrapehero("http://masteroverwatch.com/heroes/15-bastion")
    bastion
  end

  def self.dva
    dva = self.scrapehero("http://masteroverwatch.com/heroes/22-d-va")
    dva
  end

  def self.genji
    genji = self.scrapehero("http://masteroverwatch.com/heroes/21-genji")
    genji
  end

  def self.hanzo
    hanzo = self.scrapehero("http://masteroverwatch.com/heroes/16-hanzo")
    hanzo
  end

  def self.junkrat
    junkray = self.scrapehero("http://masteroverwatch.com/heroes/2-junkrat")
    junkray
  end

  def self.lucio
    lucio = self.scrapehero("http://masteroverwatch.com/heroes/3-lucio")
    lucio
  end

  def self.mccree
    mccree = self.scrapehero("http://masteroverwatch.com/heroes/6-mccree")
    mccree
  end

  def self.mei
    mei = self.scrapehero("http://masteroverwatch.com/heroes/20-mei")
    mei
  end

  def self.mercy
    mercy = self.scrapehero("http://masteroverwatch.com/heroes/17-mercy")
    mercy
  end

  def self.pharah
    pharah = self.scrapehero("http://masteroverwatch.com/heroes/11-pharah")
    pharah
  end

  def self.reaper
    reaper = self.scrapehero("http://masteroverwatch.com/heroes/8-reaper")
    reaper
  end

  def self.reinhardt
    reinhardt = self.scrapehero("http://masteroverwatch.com/heroes/12-reinhardt")
    reinhardt
  end

  def self.roadhog
    roadhog = self.scrapehero("http://masteroverwatch.com/heroes/1-roadhog")
    roadhog
  end

  def self.soldier76
    soldier76 = self.scrapehero("http://masteroverwatch.com/heroes/4-soldier-76")
    soldier76
  end

  def self.symmetra
    symmetra = self.scrapehero("http://masteroverwatch.com/heroes/13-symmetra")
    symmetra
  end

  def self.torbjorn
    torbjorn = self.scrapehero("http://masteroverwatch.com/heroes/14-torbjorn")
    torbjorn
  end

  def self.tracer
    tracer = self.scrapehero("http://masteroverwatch.com/heroes/7-tracer")
    tracer
  end

  def self.widowmaker
    widowmaker = self.scrapehero("http://masteroverwatch.com/heroes/9-widowmaker")
    widowmaker
  end

  def self.winston
    winston = self.scrapehero("http://masteroverwatch.com/heroes/10-winston")
    winston
  end

  def self.zarya
    zarya = self.scrapehero("http://masteroverwatch.com/heroes/5-zarya")
    zarya
  end

  def self.zenyatta
    zenyatta = self.scrapehero("http://masteroverwatch.com/heroes/18-zenyatta")
    zenyatta
  end

  # def self.hero_collect
  #   @@urls.each do |url|
  #     x = self.scrapehero(url)
  #     @@all << x
  #   end
  #   @@all
  # end

end
