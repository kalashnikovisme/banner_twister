class Web::BannerController < ApplicationController
  include Banners

  def show
    load_banners "#{Rails.root}/banners.csv"
  end
end
