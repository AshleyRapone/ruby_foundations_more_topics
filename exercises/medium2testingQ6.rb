require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal(previous_amount + 20, current_amount)
  end

  def test_change
    register = CashRegister.new(100)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    assert_equal(0, register.change(transaction))
  end

  def test_give_reciept
    register = CashRegister.new(100)
    transaction = Transaction.new(35)
    assert_output("You've paid $#{transaction.item_cost}.\n") do
      register.give_receipt(transaction)
    end
  end

  def test_prompt_for_payment
    transaction = Transaction.new(50)
    previous_amount = transaction.amount_paid
    transaction.prompt_for_payment
    current_amount = transaction.amount_paid
    assert_equal(previous_amount + 50, current_amount)
  end
end
