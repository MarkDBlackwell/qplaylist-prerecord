# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb July 5, 2018 - created
=end

module ::QplayistPrerecord
  module Helper
    extend self

    private

    def directory_etc_example
      ::File.join project_root, 'etc', 'example'
    end

    def directory_lib
      ::File.join project_root, 'lib'
    end

    def dirname_script_this
      ::Kernel.__dir__
    end

    def project_root
       @project_root_value ||= ::File.realpath ::File.join(*%w[..]*2), dirname_script_this
    end

    def whitespace_compress(s)
      s.strip.gsub whitespace_compress_regexp, ' '
    end

    def whitespace_compress_regexp
       @whitespace_compress_regexp_value ||= ::Regexp.new '\s++'
    end
  end
end
