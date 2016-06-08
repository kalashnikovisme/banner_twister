class Web::BannersController < ApplicationController
  def show
    session[:last_banner_ids] ||= []
    categories = Category.where name: params[:category]
    index = 0
    banners = Banner.where.not(count: 0).where(id: categories.map(&:banners).flatten.map(&:id)).sort { |a, b| b <=> a }
    loop do
      @banner = banners[index]
      if session[:last_banner_ids].include? @banner.id
        index += 1
      else
        break 
      end
    end
    session[:last_banner_ids] << @banner.id
    @banner.update_attributes count: @banner.count - 1
  end
end
