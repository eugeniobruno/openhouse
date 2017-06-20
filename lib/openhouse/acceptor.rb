module OpenHouse
  module Acceptor
    def accept_visitor(visitor, *args)
      visitor.public_send("visit_#{own_acceptor_type_id}", self, *args)
    end

    def accept_visitor_in_ancestry(visitor, *args)
      accept_visitor_in_modules(visitor, self.class.ancestors, *args)
    end

    private

    def own_acceptor_type_id
      acceptor_type_id(self.class)
    end

    def acceptor_type_id(modul)
      if modul.const_defined?(:ACCEPTOR_TYPE_ID, false)
        modul::ACCEPTOR_TYPE_ID
      else
        OpenHouse.simple_inflector.underscored_demodulized(modul.name).to_sym
      end
    end

    def accept_visitor_in_modules(visitor, modules, *args)
      modules.each do |modul|
        method_name_suffix = acceptor_type_id(modul)
        if visitor.respond_to?("visit_#{method_name_suffix}")
          return visitor.public_send("visit_#{method_name_suffix}", self, *args)
        end
      end

      error_message = "undefined method 'visit_[acceptor_type_id]' for #{visitor.class} for any of these modules: #{modules}"
      raise NoMethodError, error_message
    end
  end
end
