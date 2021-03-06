# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::Variant do
  let(:variant) { create(:variant) }
  let(:drip) { variant.drip }

  describe 'action hooks' do
    it "triggers on create" do
      product = variant.product
      expect_any_instance_of(SolidusDrip::ShopperActivity::Product).
        to(receive(:product_activity).with('created'))
      product.variants.create
    end

    it "triggers on update" do
      expect(drip).to(receive(:product_activity).with('updated'))
      variant.update(updated_at: Time.current)
    end

    it "triggers on destroy" do
      expect(drip).to(receive(:product_activity).with('deleted'))
      variant.destroy
    end
  end
end
