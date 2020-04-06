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


    def read_file(file_path)
      file = File.open(file_path)
      file_data = file.readlines.map(&:chomp)
      file.close

      file_data
    end
    def validates_args(args)
      raise StandardError.new 'Wrong number of parameters' unless args.size == 2
    end
end
