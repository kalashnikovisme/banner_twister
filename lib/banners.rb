require 'csv'

module Banners
  def load_banners(filepath)
    csv = CSV.parse File.read filepath 
    csv.each do |row|
      Banner.create url: row[0], categories: load_categories(row)
    end
  end

  private

  def load_categories(row)
    row.reduce([]).with_index do |categories, category, index|
      unless index == 0
        categories += [category]
      end
    end
  end
end

