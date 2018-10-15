# coding: utf-8

=begin
Copyright (C) 2018 Mark D. Blackwell.
   All rights reserved.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
=end

require 'class_dynamic'

module ::QplayistPrerecord
  class Song < ClassDynamic

# Start time is an array of two integers.
# Artist and Title are strings.

    def self.fields_ordered
      %i[
        start_time
        artist
        title
        ]
    end

    attr_reader(*fields_ordered)
  end
end
