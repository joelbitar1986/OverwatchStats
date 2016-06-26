#OverwatchStats::Hero.bastion
class OverwatchStats::Hero

  attr_accessor :name, :abilities, :lore, :hp, :ammo

  def initialize(name)
    @name = name
  end

  def self.bastion
    bastion = OverwatchStats::Hero.new("Bastion")
    page_url = "http://masteroverwatch.com/heroes/15-bastion"
    doc = Nokogiri::HTML(open(page_url))
    bastion.lore = doc.css("div.heroes-lore p").text
    bastion.abilities = []
    doc.css("div.heroes-abilities-ability").each do |ability|
      ability_name = ability.css("div.ability-name").text
      ability_description = ability.css("div.ability-description").text
      bastion.abilities << {:ability_name => ability_name, :ability_description => ability_description}
    end
    bastion.abilities
    binding.pry
  end

end
