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
        cartridge_numbers
        ]
    end

    attr_reader(*fields_ordered)

    def initialize(line)
      tokens =     line.split ' '
      @name = tokens.first
      @cartridge_numbers = tokens.drop name_token_count
      check tokens
      nil
    end

    private

    def cartridge_number_length
      @@cartridge_number_length_value ||= '0123'.length
    end

    def cartridge_number_regexp
      @@cartridge_number_regexp_value ||= ::Regexp.new '\A\d++\z', ::Regexp::MULTILINE
    end

    def check(             tokens)
      ::Kernel.exit unless tokens.length > name_token_count
      @cartridge_numbers.each do |cart|
        ::Kernel.exit unless cart.length == cartridge_number_length
        ::Kernel.exit unless cartridge_number_regexp =~ cart
      end
      nil
    end

    def name_token_count
      1
    end
  end
end
