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
end

=begin
-Since accept_money is a method from the CashRegister class we need to instantiate a CashRegister object
-Since CashRegister initialize method takes an argument that is set to the instance variable @total_money
 we have to add what we want @total_money to be in the cash register
-Since the accept_money method takes a transaction object as an argument we need to create a Transaction class
-Since Transaction initialize method takes an argument that is set to the instance variable @item_cost
 we have to add what we want @item_cost to be for transaction
-Looking at the accept_money method we see that amount_paid is called on the transaction object which means we need to
 have the amount_paid instance variable be equal to transaction amoutn 20

-need to see if the cahs register is adding moeny to the total_money instance variable so
 we put previous_amount = register.total_money
 -we call the accept_money method(the method we are testing) on register which is where the method is from  and pass in our transaction
-We call the total_money method on the register object and put that in current_amount

-We compare previous_amount + 20 which is what we are going to be putting in the cash register and current_amount
=end
