# coding: utf-8

=begin
Copyright (C) 2018 Mark D. Blackwell.
   All rights reserved.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
=end

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
