require "chinese_cities/version"
require "chinese_cities/database"

module ChineseCities
  autoload :Province, 'chinese_cities/province'
  autoload :City,     'chinese_cities/city'
  autoload :Region,   'chinese_cities/region'

  def self.search(name)
    provinces = PROVINCES.select { |province| province[:name] =~ /#{name}/ }
    cities = CITIES.select { |city| city[:name] =~ /#{name}/}
    regions = REGIONS.select { |region| region[:name] =~ /#{name}/ }

    {
      provinces: provinces,
      cities: cities,
      regions: regions
    }
  end
end
