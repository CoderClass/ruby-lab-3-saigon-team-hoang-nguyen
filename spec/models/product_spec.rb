require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '.alphabetical' do
    it "sort by product name" do
      expect(Product.alphabetical).to be_empty
    end

    it "return [a] when there is only one product a" do
      Product.create!(name: "a")
      expect(Product.alphabetical).to eq(["a"])
    end

    it "return [a,b,c] after I create 3 product c,b,a" do
      Product.create!(name:"c")
      Product.create!(name:"b")
      Product.create!(name:"a")
      expect(Product.alphabetical).to eq(["a","b","c"])
    end
  end

  describe 'discount amount' do
    it "price more than 100,000 VND then discount amount is 21%" do
        p = Product.create!(name:a,price_vnd:110000)
        expect(p.discount_amount).to eq(0.21)
    end

    it "price more than 200,000 VND then discount amount is 31%" do
      p = Product.create!(name:a,price_vnd:210000)
      expect(p.discount_amount).to eq(0.31)
    end

    it "price more than 800,000 VND then discount amount is 41%" do
      p = Product.create!(name:a,price_vnd:210000)
      expect(p.discount_amount).to eq(0.41)
    end
  end

  describe "Final price" do
    it "price is 115,000 then final price is 120,000" do
      p = Product.create!(name:a,price_vnd:115000)
      expect(p.final_price).to eq(120000)
    end

    it "price is 114,000 then final price is 110,000" do
      p = Product.create!(name:a,price_vnd:114000)
      expect(p.final_price).to eq(110000)
    end
  end
end
