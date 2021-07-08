require 'pry'
class CashRegister

    attr_accessor :total, :discount, :title, :price

    def initialize(discount = 0)
        @total = 0
        @items = []
        @prices = []
        @discount = discount
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        (1..quantity).collect do |item|
            @items << title
            @prices << price
            @last_transaction_amount = price * quantity
        end
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."   
        else 
            @total = @total - (@discount * @total / 100)
            "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @last_transaction_amount
    end

end
