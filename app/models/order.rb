class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: {
    waiting_for_payment:0, payment_confirmation:1, in_production:2, shipping_preparation:3, sent:4
  }

  def self.ransackable_attributes(auth_object = nil)
    ["name","introduction"]
  end

end