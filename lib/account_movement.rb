require 'account_movement/account'

module AccountMovement
  class CLI
    def start(args)
      validates_args(args)

    rescue StandardError => e
      puts e.message
      e.message
    end

    private

    def validates_args(args)
      raise StandardError.new 'Wrong number of parameters' unless args.size == 2
    end
end
