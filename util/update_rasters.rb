#########################################
# update_rasters
# Update PNGs from original SVG sources
#########################################

require 'rubygems'

gem 'emojidex'
gem 'emojidex-converter'
gem 'emojidex-vectors', github: 'emojidex/emojidex-vectors'

require 'emojidex'
require 'emojidex_converter'
require 'emojidex-vectors'

# UTF
converter = Emojidex::Converter.new(destination: '../emoji/utf')
utf = Emojidex::UTF.new

puts "Rasterizing UTF emoji"
puts "入[#{utf.source_path}] 出[#{converter.destination}]"
converter.rasterize_collection(utf)

# Extended
converter = Emojidex::Converter.new(destination: '../emoji/extended')
extended = Emojidex::Extended.new

puts "Rasterizing Extended emoji"
puts "入[#{extended.source_path}] 出[#{converter.destination}]"
converter.rasterize_collection(extended)
