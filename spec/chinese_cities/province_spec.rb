# encoding: utf-8

require 'rspec'
require 'chinese_cities/province'

module ChineseCities

  describe Province do
    before :all do
      @province = Province.find(1)
    end

    context '#cities' do
      it 'should have cities' do
        result = @province.cities
        result.should_not be_empty
      end
    end

    context '#city_names' do
      it 'should have city_names' do
        result = @province.city_names
        result.should_not be_empty
      end
    end

    context '.new' do
      it 'should be a private method' do
        lambda { Province.new(PROVINCES.first) }.should raise_error
      end
    end

    context '.find' do
      it 'should find a province' do
        result = Province.find(1)
        result.should_not be_nil
      end

      it 'should not find a province' do
        result = Province.find(0)
        result.should be_nil
      end
    end

    context '.all' do
      it 'should get all provinces' do
        result = Province.all
        result.should_not be_empty
      end
    end

    context '.all_names' do
      it 'should get all province names' do
        result = Province.all_names
        result.should_not be_empty
      end
    end

    context '.where' do
      it 'should get a province' do
        result = Province.where('北京市')
        result.should_not nil
      end

      it 'should not get any province' do
        result = Province.where('哈哈')
        result.should nil
      end
    end

  end
end
