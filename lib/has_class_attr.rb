module StarterStep

  module HasClassAttr
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def has_class_attr(field_name, attrs={})
        raise "You must provide data to the attribute using the :data key" unless attrs[:data]
        class_eval "@#{field_name} = attrs[:data]"
        class_eval %( class << self; attr_accessor :#{field_name} end)
      end
    end
  end
end

Object.send(:include, StarterStep::HasClassAttr)