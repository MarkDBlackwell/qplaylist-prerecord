# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb July 4, 2018 - created
=end

module ::QplayistPrerecord
  class Song

# Start time is an array of two integers.
# Artist and Title are strings.

    fields_ordered = %i[
        start_time
        artist
        title
        ]

    attr_reader *fields_ordered

    def initialize(*a)
      self.class.fields_ordered.zip(a).each{|field, value| instance_variable_set :"@#{field}", value}
      nil
    end

    def <=>(other)
      a = [self, other].map do               |object|
        self.class.fields_ordered.map{|field| object.instance_variable_get :"@#{field}"}
      end
      a.first <=> a.last
    end
  end
end
