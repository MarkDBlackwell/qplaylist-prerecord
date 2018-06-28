# coding: utf-8

=begin
Author: Mark D. Blackwell (google me)
mdb June 28, 2018 - created
=end

module ::Methods
  module InstanceMethods

    def command_run(array)
      ::Kernel.system *array
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
