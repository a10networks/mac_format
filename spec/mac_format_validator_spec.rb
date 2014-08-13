require 'spec_helper'

describe MacFormatValidator do

  let(:fake_model) { FakeModel.new }

  context "with valid macs" do

    let(:valid_macs) { %w(aabbccddeeff aabbccddeeff*&^&^:: aabbccddee::ff 11-22-33-44-55-66) }

    it "should be happy" do
      valid_macs.each do |mac|
        fake_model.mac = mac
        expect(fake_model.valid?).to be_truthy
      end
    end
  end

  context "with invalid macs" do

    let(:invalid_macs) { %w(aabbccddeeffaa aa) }

    it "shouldn't be happy" do
      invalid_macs.each do |mac|
        fake_model.mac = mac
        expect(fake_model.valid?).to be_falsey
      end
    end
  end

  context "with allow_blank: true" do

    let(:fake_model)   { FakeModelWithBlankMac.new }
    let(:blank_macs) { ['', nil, ' '] }

    it "should allow blank macs" do
      blank_macs.each do |blank_mac|
        fake_model.mac = blank_mac
        expect(fake_model.valid?).to be_truthy
      end
    end
  end
end
