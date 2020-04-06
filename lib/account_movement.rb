require 'account_movement/account'

module AccountMovement
  class CLI
    def start(args)
      validates_args(args)

      accounts = create_accounts(read_file(args[0]))
      accounts = create_transactions(read_file(args[1]), accounts)
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

    def create_transactions(transactions_data, accounts)
      transactions_data.each do |transaction|
        account = accounts.select { |account| account.id == transaction[0] }
        raise StandardError.new 'Account not found in TRANSACTION file' if account.count < 1

        account = account.pop
        account.balance += transaction[1]
        account.balance -= 3 if account.balance.negative? && transaction[1].negative?
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
end
