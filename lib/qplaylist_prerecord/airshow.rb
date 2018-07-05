# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb June 28, 2018 - created
=end

module ::QplayistPrerecord
  class Airshow

    attr_reader :name

    def initialize(name)
      @name = name
    end

    def <=>(other)
      a = [self, other].map do |object|
        %i[name].map{|field|    object.instance_variable_get :"@#{field}"}
      end
      a.first <=> a.last
    end
  end
end
