class Ad < ApplicationRecord
  belongs_to :product_category
  belongs_to :company_employee
  has_many_attached :images
end
