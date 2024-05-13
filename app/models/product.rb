class Product < ApplicationRecord
    has_many :product_images
    has_many_attached :images

    attribute :remove_images, :boolean, default: false

end
