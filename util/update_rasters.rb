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
utf_dest = '../emoji/utf'
FileUtils.rm_rf(utf_dest)
converter = Emojidex::Converter.new(destination: utf_dest)
utf = Emojidex::UTF.new

puts "Rasterizing UTF emoji"
puts "入[#{utf.source_path}] 出[#{converter.destination}]"
converter.rasterize_collection(utf)

# Extended
extended_dest = '../emoji/extended'
FileUtils.rm_rf(extended_dest)
converter = Emojidex::Converter.new(destination: extended_dest)
extended = Emojidex::Extended.new

puts "Rasterizing Extended emoji"
puts "入[#{extended.source_path}] 出[#{converter.destination}]"
converter.rasterize_collection(extended)
