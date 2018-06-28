# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb June 28, 2018 - created
=end

require 'English'

dirname_file_current = ::Kernel.__dir__
lib = dirname_file_current
package = 'qplaylist_prerecord'

branch = ::File.join lib, package
real = ::File.realpath branch
$LOAD_PATH.unshift real unless $LOAD_PATH.include? real
