class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

 validate :cart_not_empty

  def subtotal
    item.with_tax_price * count
  end

  private

  def cart_not_empty
    errors.add(:base, "カートが空です") if customer.cart_items.empty?
  end

end
