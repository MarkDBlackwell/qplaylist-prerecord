# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb July 4, 2018 - created
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
