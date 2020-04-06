
module AccountMovement
  class CLI
    def start(args)
      validates_args(args)

    private

    def validates_args(args)
      raise StandardError.new 'Wrong number of parameters' unless args.size == 2
    end
end
