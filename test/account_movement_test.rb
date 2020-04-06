require "test_helper"

class AccountMovementTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::AccountMovement::VERSION
  end

  def test_wrong_number_of_args
    cli = AccountMovement::CLI.new()
    assert_equal cli.start([]), 'Wrong number of parameters'
    assert_equal cli.start(["./test/fixtures/account.csv"]), 'Wrong number of parameters'
    assert_equal cli.start(["./test/fixtures/account.csv", "./test/fixtures/account.csv", "./test/fixtures/transaction.csv"]), 'Wrong number of parameters'
  end

  def test_file_path_wrong_or_file_not_found
    cli = AccountMovement::CLI.new()
    assert_equal cli.start(["./test/fixtures/account_wrong.csv", "./test/fixtures/transaction.csv"]), "No such file or directory @ rb_sysopen - ./test/fixtures/account_wrong.csv"
  end

  def test_file_with_not_valid_data
    cli = AccountMovement::CLI.new()
    assert_equal cli.start(["./test/fixtures/account_not_valid.csv", "./test/fixtures/transaction.csv"]), 'Non-integer type data in files'
    assert_equal cli.start(["./test/fixtures/account.csv", "./test/fixtures/transaction_not_valid.csv"]), 'Non-integer type data in files'
  end

  def test_duplicate_account_in_file
    cli = AccountMovement::CLI.new()
    assert_equal cli.start(["./test/fixtures/account_duplicate.csv", "./test/fixtures/transaction.csv"]), 'Duplicate accounts in ACCOUNT file'
  end

  def test_account_create
    account = Account.new(id: 5, balance: 555)

    assert_equal account.class, Account
    assert_equal account.id, 5
    assert_equal account.balance, 555
  end

  def test_transaction_to_account_not_found
    cli = AccountMovement::CLI.new()
    assert_equal cli.start(["./test/fixtures/account.csv", "./test/fixtures/transaction_not_found.csv"]), 'Account not found in TRANSACTION file'
  end

  def test_response
    cli = AccountMovement::CLI.new()
    response = cli.start(["./test/fixtures/account.csv", "./test/fixtures/transaction.csv"])

    balance_final = [-10, -10, 310]

    response.each_with_index do |account, index|
      assert_equal account.class, Account
      assert_equal account.id, index + 1
      assert_equal account.balance, balance_final[index]
    end
  end
end
