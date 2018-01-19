require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to respond_to :order_items }
  it { is_expected.to respond_to :add }
end
