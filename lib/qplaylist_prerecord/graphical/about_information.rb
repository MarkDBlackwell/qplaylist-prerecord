# coding: utf-8

=begin
Copyright (C) 2018 Mark D. Blackwell.
   All rights reserved.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
=end

require 'graphical_helper'

module ::QplayistPrerecord
  module Graphical
    module AboutInformation
      include GraphicalHelper
      extend self

      attr_accessor :show

      def init
        if show
          l_about_information.text about_information_text_raw
        end
        nil
      end

      def pack
        if show
          l_about_information.pack pack_standard
        end
        nil
      end

      private

      def about_information_text_raw
        @about_information_text_raw_private ||= <<END.chomp
QPlaylist Prerecord #{::QplayistPrerecord::VERSION}
Copyright (C) 2018 Mark D. Blackwell.
No license. All rights reserved.
Contact: markdblackwell01@gmail.com
END
      end

      def l_about_information
        @l_about_information_private ||= ::Tk::Tile::Label.new f_body_window
      end
    end
  end
end
