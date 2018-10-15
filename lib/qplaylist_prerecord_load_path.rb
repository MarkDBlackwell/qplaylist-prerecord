# coding: utf-8

=begin
Copyright (C) 2018 Mark D. Blackwell.
   All rights reserved.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
=end

require 'English'

package_name = 'qplaylist_prerecord'
section_names = %w[ ungraphical ]

dirname_file_current = ::Kernel.__dir__
project_root = ::File.join dirname_file_current, '..'
lib = ::File.join project_root, 'lib'
package = ::File.join lib, package_name
sections = section_names.map{|e| ::File.join package, e}

paths = [lib, package] + sections
paths.each do |path|
  real = ::File.realpath path
  $LOAD_PATH.unshift real unless $LOAD_PATH.include? real
end
