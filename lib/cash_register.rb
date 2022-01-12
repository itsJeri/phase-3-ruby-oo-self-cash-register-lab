require 'pry'
class CashRegister
    attr_accessor :total, :previous_transaction
    attr_reader :discount, :items_array

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items_array = []
    end

    def add_item(title, price, quantity=1)
        quantity.times do
            @items_array.push({title: title, price: price, quantity: quantity})
        end
        @total += price * quantity
        @previous_transaction = price * quantity
    end

    def apply_discount
        if @discount > 0
            @total *= (1 - @discount/100.0)
            return "After the discount, the total comes to $#{@total.to_i}."
        else 
            return "There is no discount to apply."
        end
    end

    def items
        self.items_array.map do |i|
            item[:title]
        end
    end

    def void_last_transaction 
        self.total -= @previous_transaction
        @previous_transaction = 0
    end
end