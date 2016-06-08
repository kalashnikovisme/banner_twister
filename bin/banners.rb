require 'csv'

csv = CSV.parse File.read ARGV[0]
csv.each do |row|
  banner = Banner.create url: row[0], count: row[1]
  row.each_with_index do |category, index|
    if index > 1
      banner.categories << Category.find_or_create_by(name: category)
    end
  end
end
