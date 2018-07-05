# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb July 4, 2018 - created
=end

module ::QplayistPrerecord
  class Song

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

    def initialize(*values)
      self.class.fields_ordered.zip(values).each{|field, value| instance_variable_set :"@#{field}", value}
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
