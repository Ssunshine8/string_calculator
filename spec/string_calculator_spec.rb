require 'string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  it 'returns 0 for an empty string' do
    expect(calculator.add("")).to eq(0)
  end

  it "returns 0 for nil input" do
    expect(calculator.add(nil)).to eq(0)
  end

  it 'returns the number itself for a single number' do
    expect(calculator.add("1")).to eq(1)
  end

  it 'returns the sum of two numbers' do
    expect(calculator.add("1,2")).to eq(3)
  end

  it 'returns the sum of multiple numbers' do
    expect(calculator.add("1,2,3,4")).to eq(10)
  end

  it 'handles newlines as delimiters' do
    expect(calculator.add("1\n2,3")).to eq(6)
  end

  it 'handles custom delimiters' do
    expect(calculator.add("//;\n1;2")).to eq(3)
  end

  it 'return an error for negative numbers' do
    expect { calculator.add("1,-2,3,4") }.to raise_error("negative numbers not allowed: -2")
  end

  it "return an error for multiple negative numbers" do
    expect { calculator.add("//;\n1;-2;-3;4") }.to raise_error("negative numbers not allowed: -2, -3")
  end
end
