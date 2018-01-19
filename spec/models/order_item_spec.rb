require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it{ is_expected.to have_db_column :id}
end
