# coding: utf-8

=begin
Copyright (C) 2018 Mark D. Blackwell.
   All rights reserved.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
=end

module ::QplayistPrerecord
  class Segment

    def self.fields_ordered
      %i[
        cart
        songs
        ]
    end

    attr_reader(*fields_ordered)
  end
end
