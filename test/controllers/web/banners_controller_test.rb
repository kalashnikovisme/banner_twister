require 'test_helper'

class Web::BannersControllerTest < ActionController::TestCase
  setup do
    banners = create_list :banner, 5
    @categories = create_list :category, 5
    @categories.each do |c|
      banners.each do |b|
        b.categories << c
      end
    end
  end

  test 'should get show' do
    get :show, category: @categories.map(&:name)
    assert_response :success
  end
end
