class Product < ApplicationRecord
    has_many :product_images
    has_many_attached :images

    attribute :remove_images, :boolean, default: false

    validates :name, :price, :description, :color, :size, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validate :validate_images

    private

    def validate_images
        if images.attached?
        images.each do |image|
            if !image.content_type.in?(%('image/jpeg image/png'))
            errors.add(:images, 'debe ser un archivo JPEG o PNG')
            end
        end
        else
        errors.add(:images, 'debes adjuntar al menos una imagen')
        end
    end

end
