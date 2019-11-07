# coding: utf-8

=begin
Copyright (C) 2018 Mark D. Blackwell.
   All rights reserved.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
=end

require 'helper_graphical'

module ::QplayistPrerecord
  module Graphical
    module AboutInformation
      include HelperGraphical
      extend self

      attr_accessor :show

      def init
        if show
          @about_information_text = ::Tk::Tile::Label.new @body
          @about_information_text.text text_about
        end
        nil
      end

      def pack
        if show
          @about_information_text.pack pack_standard
        end
        nil
      end

      private

      def text_about
        @text_about_private ||= <<END.chomp
QPlaylist Prerecord #{::QplayistPrerecord::VERSION}
Copyright (C) 2018 Mark D. Blackwell.
No license. All rights reserved.
Contact: markdblackwell01@gmail.com
END
      end
    end
  end
end