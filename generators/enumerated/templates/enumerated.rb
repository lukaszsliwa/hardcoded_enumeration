class <%= class_name %> < HardcodedEnumeration::Base
  enumerates <%= actions.map {|a| ":#{a}"}.join(", ") %>
end

