module HardcodedEnumeration
  module ActiveRecordExtensions

    def has_hardcoded_enumerated(relation_name, options={})
      relation_name = relation_name.to_s
      relation_attribute = (options[:foreign_key] || "#{relation_name}_id").to_s
      relation_class = (options[:class_name] || relation_name.camelcase).constantize
      
      logger.debug "Defining hardcoded enumeration '#{relation_name}' (#{relation_class}): #{relation_attribute}"
      
      define_method("#{relation_name}=") do |value|
        attribute_value = case value
          when HardcodedEnumeration::Base then value.id
          when nil then nil
          else relation_class[value].id
        end
        logger.debug "Setting #{relation_attribute} to #{attribute_value}"
        write_attribute(relation_attribute, attribute_value)
      end

      define_method(relation_name) do
        value = read_attribute(relation_attribute)
        logger.debug "Getting #{relation_attribute} as #{value}"
        relation_class.find_by_key(value)
      end
      alias belongs_to_enumerated has_hardcoded_enumerated
      
      self.class_eval %{ 
        def self.find_all_by_#{relation_name}(value)
          enum = #{relation_class}.find_by_key(value)
          value = enum ? enum.id : nil
          find_all_by_#{relation_attribute}(value)
        end
      }, __FILE__, __LINE__
    end
  end
end
