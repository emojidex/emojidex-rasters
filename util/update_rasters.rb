#########################################
# update_rasters
# Update PNGs from original SVG sources
#########################################

require 'emojidex'
require 'emojidex/data/utf'
require 'emojidex/data/extended'
require 'emojidex_converter'
require 'emojidex-vectors'

@max_threads = 16

def convert_utf
  # UTF
  utf_dest = '../emoji/utf'
  FileUtils.rm_rf(utf_dest)
  converter = Emojidex::Converter.new(destination: utf_dest, noisy: true, max_threads: @max_threads)
  utf = Emojidex::Data::UTF.new(r18: true)

  puts "Rasterizing UTF emoji"
  puts "入[#{utf.source_path}] 出[#{converter.destination}]"
  converter.rasterize_collection(utf)
end

def convert_extended
  # Extended
  extended_dest = '../emoji/extended'
  FileUtils.rm_rf(extended_dest)
  converter = Emojidex::Converter.new(destination: extended_dest, noisy: true, max_threads: @max_threads)
  extended = Emojidex::Data::Extended.new(r18: true)

  puts "Rasterizing Extended emoji"
  puts "入[#{extended.source_path}] 出[#{converter.destination}]"
  converter.rasterize_collection(extended)
end

convert_utf
convert_extended
