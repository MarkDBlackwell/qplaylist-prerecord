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

      def init
        if @show
          @text = ::Tk::Tile::Label.new @body do
            text <<END.chomp
QPlaylist Prerecord #{::QplayistPrerecord::VERSION}
Copyright (C) 2018 Mark D. Blackwell.
No license. All rights reserved.
Contact: markdblackwell01@gmail.com
END
          end
        end
        nil
      end

      def pack
        if @show
          @text.pack pack_standard
        end
        nil
      end

      def show=(v)
        @show = v
      end

      private
    end
  end
end
