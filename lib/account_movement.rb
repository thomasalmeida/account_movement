require 'account_movement/account'

module AccountMovement
  class CLI
    def start(args)
      validates_args(args)

      accounts = create_accounts(read_file(args[0]))
      accounts = create_transactions(read_file(args[1]), accounts)
      generate_report(accounts)
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
      transactions_data = clean_data(transactions_data)

      transactions_data.each do |transaction|
        account = accounts.select { |account| account.id == transaction[0] }
        raise StandardError.new 'Account not found in TRANSACTION file' if account.count < 1

        account = account.pop
        account.balance += transaction[1]
        account.balance -= 3 if account.balance.negative? && transaction[1].negative?
      end

      accounts
    end

    def generate_report(accounts)
      accounts.sort_by(&:id).each { |account| puts "#{account.id},#{account.balance}" }
    end

    def read_file(file_path)
      file = File.open(file_path)
      file_data = file.readlines.map(&:chomp)
      file.close

      file_data
    end

    def clean_data(data)
      data.map { |d| d.split(',').map {|dd| is_data_integer?(dd)} }
    end

    def is_data_integer?(data)
      raise StandardError.new 'Non-integer type data in files' unless /\A[-+]?\d+\z/ === data.delete(' ')

      data.to_i
    end

    def validates_args(args)
      raise StandardError.new 'Wrong number of parameters' unless args.size == 2
    end
  end
end
