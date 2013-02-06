require 'test_helper'
require 'securerandom'
require 'uuidtools'

describe ActiveModel::Validations::UuidValidator do

  before do
    TestModel.reset_callbacks(:validate)
    I18n.locale = 'en'
  end

  describe "validates :key, :uuid => true" do
    before do
      TestModel.validates :key, :uuid => true
    end

    describe "passes for wikipedia sample" do
      it "is valid" do
        key = "550e8400-e29b-41d4-a716-446655440000"
        model = TestModel.new(key: key)
        model.valid?.must_equal true
      end
    end

    describe "test for SecureRandom.uuid" do
      it "is valid" do
        model = TestModel.new(key: SecureRandom.uuid)
        model.valid?.must_equal true
      end
    end

    describe "test for UUIDTools" do
      it "is valid for md5_create" do
        key = UUIDTools::UUID.md5_create(UUIDTools::UUID_DNS_NAMESPACE, "www.example.com").to_s
        model = TestModel.new(key: key)
        model.valid?.must_equal true
      end

      it "is valid for sha1_create" do
        key = UUIDTools::UUID.sha1_create(UUIDTools::UUID_DNS_NAMESPACE, "www.example.com").to_s
        model = TestModel.new(key: key)
        model.valid?.must_equal true
      end

      it "is valid for timestamp_create" do
        key = UUIDTools::UUID.timestamp_create.to_s
        model = TestModel.new(key: key)
        model.valid?.must_equal true
      end

      it "is valid for random_create" do
        key = UUIDTools::UUID.random_create.to_s
        model = TestModel.new(key: key)
        model.valid?.must_equal true
      end
    end

    def error_in(model)
      model.valid?.must_equal false
      model.errors[:key].must_equal ["is not an uuid"]
    end

    describe "when nil" do
      it "is invalid" do
        error_in TestModel.new(key: nil)
      end
    end

    describe "when empty string" do
      it "is invalid" do
        error_in TestModel.new(key: '')
      end
    end

    describe "when non number" do
      it "is invalid" do
        key = "550e8400-e29b-41d4-a716-XXXXXXXXXXXX"
        error_in TestModel.new(key: key)
      end
    end

  end

  describe "validates :key, :uuid =>  { :lower => true }" do
    before do
      TestModel.validates :key, :uuid =>  { :lower => true }
    end

    describe "passes for wikipedia sample" do
      it "is valid" do
        key = "550e8400-e29b-41d4-a716-446655440000"
        model = TestModel.new(key: key)
        model.valid?.must_equal true
      end
    end

    describe "passes for wikipedia sample upper-case" do
      it "is valid" do
        key = "550e8400-e29b-41d4-a716-446655440000".upcase
        model = TestModel.new(key: key)
        model.valid?.must_equal false
      end
    end
  end
end

