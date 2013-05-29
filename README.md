# Chinese Cities

Chinese provinces and cities collection

## Installation

Add this line to your application's Gemfile:

    gem 'chinese_cities'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chinese_cities

## Usage

Data from http://www.stats.gov.cn/tjbz/xzqhdm/index.htm.

```ruby
province = ChineseCities::Province.where '北京市'
=> #<ChineseCities::Province:0xa0d154c @id=1, @name="北京市">

province.name
=> '北京市'

province.cities
=> [#<ChineseCities::City:0xa04e714 @id=1, @province_id=1, @name="北京市">]

city = province.cities.first

city.regions
=> [
     #<ChineseCities::Region:0xa084ee0 @id=1, @city_id=1, @name="东城区">
     #<ChineseCities::Region:0xa084ecc @id=2, @city_id=1, @name="西城区">
     #<ChineseCities::Region:0xa084eb8 @id=3, @city_id=1, @name="朝阳区">
     #<ChineseCities::Region:0xa084ea4 @id=4, @city_id=1, @name="丰台区">
     #<ChineseCities::Region:0xa084e90 @id=5, @city_id=1, @name="石景山区">
     #<ChineseCities::Region:0xa084e7c @id=6, @city_id=1, @name="海淀区">
     #<ChineseCities::Region:0xa084e68 @id=7, @city_id=1, @name="门头沟区">
     #<ChineseCities::Region:0xa084e54 @id=8, @city_id=1, @name="房山区">
     #<ChineseCities::Region:0xa084e40 @id=9, @city_id=1, @name="通州区">
     #<ChineseCities::Region:0xa084e2c @id=10, @city_id=1, @name="顺义区">
     #<ChineseCities::Region:0xa084e18 @id=11, @city_id=1, @name="昌平区">
     #<ChineseCities::Region:0xa084e04 @id=12, @city_id=1, @name="大兴区">
     #<ChineseCities::Region:0xa084df0 @id=13, @city_id=1, @name="怀柔区">
     #<ChineseCities::Region:0xa084ddc @id=14, @city_id=1, @name="平谷区">
     #<ChineseCities::Region:0xa084dc8 @id=15, @city_id=1, @name="密云县">
     #<ChineseCities::Region:0xa084db4 @id=16, @city_id=1, @name="延庆县">
   ]

ChineseCities::Province.all
=> [ An array of all province objects ]

ChineseCities::Province.all_names
=> [ An array of all province names ]

cities = ChineseCities::City.where '杭州市'
=> [#<ChineseCities::City:0xac40464 @name="杭州市">]

cities.first.province
=> #<ChineseCities::Province:0xa0931c0 @id=11, @name="浙江省">

city.province_name
=> '浙江省'

ChineseCities::City.all
=> [ An array of all cities objects ]

ChineseCities::City.all_names
=> [ An array of all cities names ]

regions = ChineseCities::Region.where('浦东新区')
=> [#<ChineseCities::Region:0x89bdb6c @id=726, @city_id=73, @name="浦东新区">]

regions.first.city
=> #<ChineseCities::City:0x89bb308 @id=73, @province_id=9, @name="黄浦区">

ChineseCities::Region.all
=> [ An array of all regions objects ]

ChineseCities::Region.all_names
=> [ An array of all regions names ]

# Search provinces, cities, regions which name like your parameter
ChineseCities.search('京')
=> {
     :provinces=>[#<ChineseCities::Province:0x9fee120 @id=1, @name="北京市">],
     :cities=>[#<ChineseCities::City:0xa040b78 @id=1, @province_id=1, @name="北京市">, #<ChineseCities::City:0xa040b64 @id=74, @province_id=10, @name="南京市">],
     :regions=>[#<ChineseCities::Region:0x9a55588 @id=817, @city_id=84, @name="京口区">, #<ChineseCities::Region:0x9a55574 @id=1567, @city_id=175, @name="京山县">]
   }



```

## Test

rspec

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
