# coding: utf-8

=begin
Copyright (C) 2018 Mark D. Blackwell.
   All rights reserved.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
=end

require 'English'

package = 'qplaylist_prerecord'

dirname_file_current = ::Kernel.__dir__
project_root = ::File.join dirname_file_current, '..'

branches = [
    ['lib'],
    ['lib', package],
    ['lib', package, 'ungraphical'],
    ['lib', package,   'graphical'],
    ]
branches.sort.each do |branch|
  path = ::File.join project_root, *branch
  real = ::File.realpath path
  $LOAD_PATH.unshift real unless $LOAD_PATH.include? real
end
