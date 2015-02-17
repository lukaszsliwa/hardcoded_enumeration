module HardcodedEnumeration
  class Base
    attr_reader :symbol
    attr_reader :id

    def self.enumerates(*symbol_list)
      @instances = []
      @instances_by_symbol = {}
      @instances_by_id = {}
      symbol_list.each_with_index do |symbol, id|
        instance = new(symbol, id + 1)
        @instances << instance
        @instances_by_id[instance.id] = instance
        @instances_by_symbol[instance.symbol] = instance
        define_method("#{symbol}?") do
          self == instance
        end
      end
    end
    
    def self.instances
      @instances
    end
    
    def self.find_by_key(key)
      case key
      when self then key
      when Symbol then @instances_by_symbol[key]
      when Integer then @instances_by_id[key]
      when String then @instances_by_id[key.to_i]
      end
    end
    
    def self.find(key)
      key == :all ? @instances : self[key]
    end

    def self.[](key)
      find_by_key(key) or raise ActiveRecord::RecordNotFound.new("No #{self.class} instance for #{key} #{key.class}")
    end


    def ==(key)
      RAILS_DEFAULT_LOGGER.debug "Comparing #{self.inspect} to #{key}(#{key.class})"
      case key
      when Symbol then @symbol == key
      when self.class then @id == key.id
      else
        false
      end
    end
    
    def inspect
      "#<#{self.class}:#{self.object_id}(id: #{@id}, symbol: #{@symbol})>"
    end
    
    def to_param
      id
    end
    
    def to_s
      symbol.to_s
    end
    
    def to_sym
      symbol
    end
    
    protected
    
    def initialize(symbol, id)
      @symbol = symbol
      @id = id
    end
  end
end