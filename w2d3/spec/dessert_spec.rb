require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :titleize => "MAJESTO") }
  subject(:des) { Dessert.new("cake", 2, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(des.type).to eq("cake")
    end
    it "sets a quantity" do
      expect(des.quantity).to eq(2)
    end
    it "starts ingredients as an empty array" do
      expect(des.ingredients).to be_empty
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "red", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      des.add_ingredient("flour")
      expect(des.ingredients).to eq(["flour"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ("a".."f").each { |i| des.add_ingredient(i) }
      des.mix!
      expect(des.ingredients).not_to eq(%w(a b c d e f))
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      des.eat(1)
      expect(des.quantity).to eq(1)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { des.eat(4) }.to raise_error(StandardError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(des.serve.include?("MAJESTO")).to be(true)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(des)
      des.make_more
    end
  end
end
