# encoding: utf-8

require 'rspec'
require 'chinese_cities/region'

module ChineseCities
  describe Region do
    before :all do
      @region = Region.find(1)
    end

    context '#city' do
      it 'should have city' do
        result = @region.city
        result.should_not be_nil
      end
    end

    context '#city_name' do
      it 'should have city_name' do
        result = @region.city_name
        result.should_not be_nil
      end
    end

    context '.new' do
      it 'should be a private method' do
        lambda { Region.new('西城区')}.should raise_error
      end
    end

    context '.find' do
      it 'should find a region' do
        result = Region.find(1)
        result.should_not be_nil
      end

      it 'should not find a region' do
        result = Region.find(0)
        result.should be_nil
      end
    end

    context '.all' do
      it 'should get all region' do
        result = Region.all
        result.should_not be_empty
      end
    end

    context '.all_names' do
      it 'should get all region names' do
        result = Region.all_names
        result.should_not be_empty
      end
    end

    context '.where' do
      it 'should get some region' do
        result = Region.where('东城区')
        result.should_not be_empty
      end

      it 'should not get region' do
        result = Region.where('哈哈')
        result.should be_nil
      end
    end

    context '.find_by_city_id' do
      it 'should find by city_id' do
        result = Region.find_by_city_id(1)
        result.should_not be_empty
      end
    end
  end
end

