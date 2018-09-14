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
mdb July 2, 2018 - created
=end

require 'helper'
require 'helper_graphical'
require 'tk'
require 'version'

module ::QplayistPrerecord
  module About
    include Helper
    include HelperGraphical
    extend self

    def main
      window_process
      nil
    end

    private

    def all_components_init
      body_components_init
      nil
    end

    def all_components_pack
      body_components_pack
      nil
    end

    def body_components_init
      body_init
# Keep alphabetical:
      button_menu_exit_init @body, 'OK'
      label_message_text_init
# (End keep alphabetical.)
      nil
    end

    def body_components_pack
      body_pack
# Order is visual order:
      label_message_text_pack
      button_menu_exit_pack
# (End visual order.)
      nil
    end

    def label_message_text_init
      @label_message_text = ::TkLabel.new @body do
        text <<END.chomp
QPlaylist Prerecord #{::QplayistPrerecord::VERSION}
Copyright (C) 2018 Mark D. Blackwell.
No license. All rights reserved.
Contact: markdblackwell01@gmail.com
END
      end
      nil
    end

    def label_message_text_pack
      @label_message_text.pack pack_standard
      nil
    end

    def program_name
      ''
    end
  end
end
