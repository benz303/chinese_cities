require "chinese_cities/version"
require "chinese_cities/database"

module ChineseCities
  autoload :Province, 'chinese_cities/province'
  autoload :City,     'chinese_cities/city'
  autoload :Region,   'chinese_cities/region'

  def self.search(name)
    provinces = Province.search(name)
    cities    = City.search(name)
    regions   = Region.search(name)

    {
      provinces: provinces,
      cities: cities,
      regions: regions
    }
  end
end
