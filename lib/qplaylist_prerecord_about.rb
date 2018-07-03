# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb July 3, 2018 - created

Ruby's use of the Tk graphical toolkit doesn't seem to allow multiple roots or windows.
As a workaround, we use this separate program for the 'About' popup.
=end

require_relative 'qplaylist_prerecord_load_path'
require 'about'

module ::QplayistPrerecord
  About.main
  nil
end
