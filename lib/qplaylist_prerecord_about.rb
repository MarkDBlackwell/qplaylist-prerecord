# coding: utf-8

=begin
Copyright (C) 2018 Mark D. Blackwell.
   All rights reserved.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
=end

=begin
Ruby's use of the Tk graphical toolkit doesn't seem to allow multiple roots or windows.
As a workaround, we use this separate program for the 'About' popup.
=end

require_relative 'qplaylist_prerecord_load_path'
require 'about'

module ::QplayistPrerecord
  About.main
  nil
end
