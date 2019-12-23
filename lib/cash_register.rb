class CashRegister

  attr_accessor :items, :discount, :total, :last_transaction

  def initialize(discount=0)       #optionally takes an employee discount on initialization
    @total = 0                     #sets an instance variable @total on initialization to 0 
    @discount = discount           
    @items = []                    # returns an array containing all items that have been added
  end

  def add_item(title, amount, quantity=1)   #accepts a title and price and optional quantity
    self.total += amount * quantity         #increases the total
    quantity.times do
      items << title
    end
    self.last_transaction = amount * quantity       #doesnt forget ab the previous total
  end

  def apply_discount
    if discount != 0
      self.total = (total * ((100.0 - discount.to_f)/100)).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction
  end
end
