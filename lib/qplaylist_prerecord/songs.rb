# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb July 4, 2018 - created
=end

require 'song'

module ::QplayistPrerecord
  module Songs
    extend self

    def all
      start_times.zip(artists, titles).map{|fields| Song.new *fields}.sort
    end

    private

    def artists
      [
          'Charity and the Jam Band',
          'The L',
          'The Jellyfish Orchestra (SpongeBob Squarepants)',
          'Caspar Babypants',
          ]
    end

    def start_times
      [
          [1 30],
          [5 34],
          [7 27],
          [8 40],
          ]
    end

    def titles
      [
          'Sing A Summer Song',
          'Popsicle',
          'The Jellyfish Song',
          'Be In The Sea',
          ]
    end
  end
end
