# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb July 3, 2018 - created
=end

module ::QplayistPrerecord
  class Airdate

    attr_reader :date

    def initialize(date)
      @date = date
    end

    def <=>(other)
      a = [self, other].map do |object|
        %i[date].map{|field|    object.instance_variable_get :"@#{field}"}
      end
      a.first <=> a.last
    end
  end
end
