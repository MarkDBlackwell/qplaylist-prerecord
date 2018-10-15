# coding: utf-8

=begin
Copyright (C) 2018 Mark D. Blackwell.
   All rights reserved.
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
=end

module ::Methods
  module InstanceMethods

    def command_run(array)
      ::Kernel.system(*array)
      nil
    end

    def filename_program
      ::File.join directory_lib, "#{name_package}.rb"
    end

    private

    def directory_lib
      ::File.join project_root, 'lib'
    end

    def dirname_script_this
      ::Kernel.__dir__
    end

    def name_package
      'qplaylist_prerecord'
    end

    def project_root
       @project_root_value ||= ::File.realpath '..', dirname_script_this
    end
  end

  include ::Methods::InstanceMethods
end
