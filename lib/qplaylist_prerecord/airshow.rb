# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb June 28, 2018 - created
=end

require 'class_dynamic'

module ::QplayistPrerecord
  class Airshow < ClassDynamic

    def self.fields_ordered
      %i[
        name
        ]
    end

    attr_reader(*fields_ordered)
  end
end
