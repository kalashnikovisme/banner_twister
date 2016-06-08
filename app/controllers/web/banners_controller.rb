class Web::BannersController < ApplicationController
  def show
    categories = Category.where name: params[:category]
    loop do
      @banner = categories.shuffle.first.banners.where.not(count: 0).shuffle.first
      break if @banner.id != session[:last_banner_id]
    end
    session[:last_banner_id] = @banner.id
    @banner.update_attributes count: @banner.count - 1
  end
end
