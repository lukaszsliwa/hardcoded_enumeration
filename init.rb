require 'hardcoded_enumeration/base'
require 'hardcoded_enumeration/active_record_extensions'
ActiveRecord::Base.class_eval do
  extend HardcodedEnumeration::ActiveRecordExtensions
end
