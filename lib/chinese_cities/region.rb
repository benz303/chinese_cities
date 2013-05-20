module ChineseCities
  class Region
    attr_accessor :id, :name, :city_id

    def initialize(id, city_id, name)
      @id = id
      @city_id = city_id
      @name = name
    end

    def city
      City.find(city_id)
    end

    def city_name
      city.name
    end

    class << self
      private :new

      def search(name)
        regions = REGIONS.select { |region| region[:name] =~ /#{name}/ }
        regions.map do |region|
          new(region[:id], region[:city_id], region[:name])
        end
      end

      def find_by_city_id(city_id)
        regions = REGIONS.select { |region| region[:city_id] == city_id }
        regions.map { |region| new(region[:id], region[:city_id], region[:name]) }
      end

      def find(id)
        region = REGIONS.find { |region| region[:id] == id }

        new(region[:id], region[:city_id], region[:name]) unless region.nil?
      end

      def where(name)
        regions = REGIONS.select { |region| region[:name] == name }
        regions.map { |region| new(region[:id], region[:city_id], region[:name]) } unless regions.empty?
      end

      def all_names
        REGIONS.map { |region| region[:name] }
      end

      def all
        REGIONS.map { |region| new(region[:id], region[:city_id], region[:name]) }
      end

    end
  end
end
