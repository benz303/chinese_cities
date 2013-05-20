module ChineseCities
  class Province
    attr_accessor :id, :name

    def initialize(id, name)
      @id = id
      @name = name
    end

    def cities
      City.find_by_province_id(id)
    end

    def city_names
      cities.map(&:name)
    end

    class << self

      private :new

      def search(name)
        provinces = PROVINCES.select { |province| province[:name] =~ /#{name}/ }
        provinces.map do |province|
          new(province[:id], province[:name])
        end
      end

      def find(id)
        province = PROVINCES.find { |province| province[:id] == id }
        new(province[:id], province[:name]) unless province.nil?
      end

      def where(name)
        province = PROVINCES.find { |province| province[:name] == name }
        new(province[:id], province[:name]) if province
      end

      def all_names
        PROVINCES.map { |province| province[:name] }
      end

      def all
        PROVINCES.map { |province| new(province[:id], province[:name]) }
      end
    end

  end
end
