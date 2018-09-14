# coding: utf-8

=begin
Copyright (C) 2018 Mark D. Blackwell.
   All rights reserved.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
=end

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
