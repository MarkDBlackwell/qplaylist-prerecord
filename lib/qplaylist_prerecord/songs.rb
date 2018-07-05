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
          'Caspar Babypants',
          'The Jellyfish Orchestra (SpongeBob Squarepants)',
          'The L',
          'Charity and the Jam Band',
          ]
    end

    def start_times
      [
          [18, 40],
          [7, 27],
          [5, 34],
          [1, 30],
          ]
    end

    def titles
      [
          'Be In The Sea',
          'The Jellyfish Song',
          'Popsicle',
          'Sing A Summer Song',
          ]
    end
  end
end
