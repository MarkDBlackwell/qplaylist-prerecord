# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb July 3, 2018 - created
=end

require 'class_dynamic'

module ::QplayistPrerecord
  class Airdate < ClassDynamic

    def self.fields_ordered
      %i[
        date
        ]
    end

    attr_reader(*fields_ordered)
  end
end
