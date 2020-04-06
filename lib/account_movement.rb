require 'account_movement/account'

module AccountMovement
  class CLI
    def start(args)
      validates_args(args)

      accounts = create_accounts(read_file(args[0]))
    rescue StandardError => e
      puts e.message
      e.message
    end

    private

    def create_accounts(data)
      data = clean_data(data)

      accounts = []

      data.each do |account_data|
        raise StandardError.new 'Duplicate accounts in ACCOUNT file' if accounts.select { |account| account.id == account_data[0] }.count > 0

        accounts << Account.new(id: account_data[0], balance: account_data[1])
      end

      accounts
    end


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
