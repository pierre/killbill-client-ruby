module KillBillClient
  module Version
    VERSION = '3.2.3'

    class << self
      def inspect
        VERSION.dup
      end

      alias to_s inspect
    end
  end
end
