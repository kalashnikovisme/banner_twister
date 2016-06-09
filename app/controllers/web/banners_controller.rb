class Web::BannersController < ApplicationController
  def show
    session[:last_banner_ids] ||= []
    categories = params[:category].present? ? Category.where(name: params[:category]) : Category.all
    banners = Banner.where.not(count: 0).where(id: categories.map(&:banners).flatten.map(&:id)).sort { |a, b| b <=> a }
    if banners.map(&:id) - session[:last_banner_ids] == []
      session[:last_banner_ids] = []
      @banner = banners.shuffle.first
    else
      index = 0
      loop do
        @banner = banners[index]
        if session[:last_banner_ids].include?(@banner.id)
          index += 1
        else
          break
        end
      end
    end
    session[:last_banner_ids] << @banner.id
    @banner.update_attributes count: @banner.count - 1
  end
end
