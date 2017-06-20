module OpenHouse
  class SimpleInflector
    def demodulized(module_name)
      module_name.split('::').last
    end

    def underscored(module_name)
      return module_name.downcase if module_name.upcase == module_name

      ret = module_name                    # MyModuleName     ABCName
            .gsub(/([A-Z])/, '_\1'.freeze) # _My_Module_Name  _A_B_C_Name
            .gsub(/([A-Z])_([A-Z])_/, '\1\2'.freeze) #        _ABC_Name
            .downcase                      # _my_module_name  _abc_name

      ret.start_with?('_') ? ret[1..-1] : ret
    end

    def underscored_demodulized(module_name)
      underscored(demodulized(module_name))
    end
  end
end
