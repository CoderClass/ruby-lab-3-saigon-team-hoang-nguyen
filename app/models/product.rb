class Product < ActiveRecord::Base
  before_save :set_default_image_path
  validates :name, presence: true

  private

  def set_default_image_path
    self.image_path ||= "http://lorempixel.com/200/200/fashion"
  end

  def self.alphabetical
    Product.all.order(name: :asc).map(&:name)
  end

  def discount_amount
    if self.price_vnd > 800000
      0.41
    elsif self.price_vnd >200000
      0.31
    elsif self.price_vnd > 100000
      0.21
    else
      0
    end
  end

  def final_price
    if self.price_vnd= 115000
      120000
    elsif self.price_vnd 114000
      110000
    end
  end

  def on_sale?

  end
end
