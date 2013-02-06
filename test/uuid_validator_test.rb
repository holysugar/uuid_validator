require 'test_helper'
require 'securerandom'
require 'uuidtools'

describe ActiveModel::Validations::UuidValidator do

  before do
    TestModel.reset_callbacks(:validate)
    I18n.locale = 'en'
  end

  def must_be_valid(key)
    TestModel.new(key: key).valid?.must_equal true
  end

  def must_be_error(key, error = 'is not an uuid')
    model = TestModel.new(key: key)
    model.valid?.must_equal false
    model.errors[:key].must_equal [error]
  end


  describe "validates :key, :uuid => true" do
    before do
      TestModel.validates :key, :uuid => true
    end

    describe "passes for wikipedia sample" do
      it "is valid" do
        must_be_valid "550e8400-e29b-41d4-a716-446655440000"
      end
    end

    describe "test for SecureRandom.uuid" do
      it "is valid" do
        must_be_valid SecureRandom.uuid
      end
    end

    describe "test for UUIDTools" do
      it "is valid for md5_create" do
        must_be_valid UUIDTools::UUID.md5_create(UUIDTools::UUID_DNS_NAMESPACE, "www.example.com").to_s
      end

      it "is valid for sha1_create" do
        must_be_valid UUIDTools::UUID.sha1_create(UUIDTools::UUID_DNS_NAMESPACE, "www.example.com").to_s
      end

      it "is valid for timestamp_create" do
        must_be_valid UUIDTools::UUID.timestamp_create.to_s
      end

      it "is valid for random_create" do
        must_be_valid UUIDTools::UUID.random_create.to_s
      end
    end

    describe "when nil" do
      it "is invalid" do
        must_be_error nil
      end
    end

    describe "when empty string" do
      it "is invalid" do
        must_be_error ''
      end
    end

    describe "when non number" do
      it "is invalid" do
        must_be_error "550e8400-e29b-41d4-a716-XXXXXXXXXXXX"
      end
    end
  end
end

