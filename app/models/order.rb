class Order < ApplicationRecord
    enum payment_method: { debit_card: 0, credit_card: 1, cash: 2, bank_transfer: 3 }

    has_many :order_items
    accepts_nested_attributes_for :order_items
end
