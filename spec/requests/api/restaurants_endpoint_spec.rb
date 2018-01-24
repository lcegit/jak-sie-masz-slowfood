require 'rails_helper'


RSpec.describe Api::RestaurantsController, type: :request do
  describe '#index' do
    context 'with anonymous doubles' do
      let!(:restaurants) do
        5.times {create(:restaurant)}
      end

      it 'returns a collection of restaurants' do
        get '/api/restaurants'
        expect(JSON.parse(response.body)['data'].count).to eq 5
      end
    end

    context 'with a specific restaurant' do
      let(:category) {create(:restaurant_category, name: 'Thai')}
      let!(:thai_food) {create(:restaurant,
                               name: 'Thai Palace',
                               description: 'Lovely place.',
                               city: 'Gothenburg',
                               street_address: 'Holtermansgatan 1C',
                               post_code: '410 29',
                               restaurant_category: category)}

      before do
        get '/api/restaurants'
        @json_resp = JSON.parse(response.body)['data'].first

      end

      it 'is a valid request' do
        expect(response.status).to eq 200
      end

      it 'includes restaurant attributes' do
        expect(@json_resp['attributes']['name']).to eq 'Thai Palace'
        expect(@json_resp['attributes']['description']).to eq 'Lovely place.'
        expect(@json_resp['attributes']['city']).to eq 'Gothenburg'
        expect(@json_resp['attributes']['post-code']).to eq '410 29'
        expect(@json_resp['attributes']['street-address']).to eq 'Holtermansgatan 1C'
      end

      it 'includes restaurant category attributes' do
        category = @json_resp['relationships']['restaurant-category']['data']
        expect(category['name']).to eq 'Thai'
      end
    end
  end

  describe '#show' do
    context 'with anonymous doubles' do
      let!(:menus) do
        3.times {create(:menu)}
      end

      it 'returns a collection of menus' do
        get '/api/restaurants'
        expect(JSON.parse(response.body)['data'].count).to eq 3
      end
    end

    context 'a menu within a specific restaurant' do
      let(:category) {create(:restaurant_category, name: 'Thai')}
      let!(:french_food) {create(:restaurant,
                         name: 'Mr French',
                         description: 'Lovely place.',
                         city: 'Gothenburg',
                         street_address: 'Holtermansgatan 1C',
                         post_code: '410 29',
                         restaurant_category: category)}
      let!(:menu_dinner) {create(:menu,
                              name: 'Dinner',
                              restaurant: french_food,
                              product_category: product_category_main)}
      let!(:product_category_main) {create(:product_category, name: 'Main', menu: menu_dinner)}
      let!(:product_name) {create(:product, name: 'Ratatouille',
                          description: 'Like the movie but better',
                          restaurant: french_food,
                          product_category: product_category_main,
                          price: 50.500,
                          image_file_link: 'http://www.example.com')}

      before do
        get '/api/restaurants'
        @json_resp = JSON.parse(response.body)['data'].first
      end

      it 'is a valid request' do
        expect(response.status).to eq 200
      end

      it 'includes restaurant attributes' do
        expect(@json_resp['attributes']['name']).to eq 'Mr French'
        expect(@json_resp['attributes']['description']).to eq 'Lovely place.'
        expect(@json_resp['attributes']['city']).to eq 'Gothenburg'
        expect(@json_resp['attributes']['post-code']).to eq '410 29'
        expect(@json_resp['attributes']['street-address']).to eq 'Holtermansgatan 1C'
      end

      it 'includes menu categories' do
        menu = @json_resp['relationships']['menu']['data']
        expect(menu['name']).to eq 'Dinner'
      end

      it 'includes product categories' do
        product_categories = @json_resp['relationships']['product-categories']['data']
        expect(product_category['name']).to eq 'Main'
      end

      it 'includes products' do
        products = @json_resp['relationships']['products']['data']
        expect(product['name']).to eq 'Ratatouille'
      end
    end
  end
end
