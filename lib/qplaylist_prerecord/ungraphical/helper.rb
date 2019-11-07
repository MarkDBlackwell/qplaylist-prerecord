# coding: utf-8

=begin
Copyright (C) 2018 Mark D. Blackwell.
   All rights reserved.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
=end

module ::QplayistPrerecord
  module Helper
    extend self

    private

    def directory_etc_example
      ::File.join project_root, 'etc', 'example'
    end

    def whitespace_compress(s)
      s.strip.gsub whitespace_compress_regexp, ' '
    end

# LOCAL:

    def dirname_script_this
      ::Kernel.__dir__
    end

    def project_root
      @project_root_private ||= ::File.realpath ::File.join(*%w[..]*3), dirname_script_this
    end

    def whitespace_compress_regexp
      @whitespace_compress_regexp_private ||= ::Regexp.new '\s++'
    end
  end
end
