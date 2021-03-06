module Virtus
  class Attribute

    # Coercer accessor wrapper
    #
    # @api private
    class Coercer
      attr_reader :method

      # Initialize a new coercer object
      #
      # @param [Object] coercers accessor
      # @param [Symbol] coercion method
      #
      # @return [undefined]
      #
      # @api private
      def initialize(coercers, method)
        @coercers = coercers
        @method   = method
      end

      # Coerce given value
      #
      # @return [Object]
      #
      # @api private
      def call(value)
        self[value.class].public_send(@method, value)
      rescue ::Coercible::UnsupportedCoercion
        value
      end

      # @api public
      def success?(primitive, value)
        self[primitive].coerced?(value)
      end

      # Return coercer object for the given type
      #
      # @return [Object]
      #
      # @api private
      def [](type)
        @coercers[type]
      end

    end # class Coercer

  end # class Attribute
end # module Virtus
