require 'spec_helper'

describe "Caesar_cipher" do

	it "shift input by n" do
		expect(converter("This is a testing text.", 5)).to eq("Ymnx nx f yjxynsl yjcy.")
	end

	it "supports modular arithmetic" do
		expect(converter("ZZZ sleeping", 8594)).to eq("NNN gzssdwbu")
	end

	it "Retains capitalization of first word" do
		expect(converter("Those were the days", 2)).to eq("Vjqug ygtg vjg fcau")
	end

	it "doesn't shift non-alphanumeric characters" do
		expect(converter("1979, $% Yeah!", 5)).to eq("6424, $% Djfm!")
	end

	it "returns nil string when one is given" do
		expect(converter("", 12)).to eq("")
	end

end