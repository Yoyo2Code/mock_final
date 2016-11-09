require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of(:url_location) }
  it { should validate_uniqueness_of(:url_location) }
  it { should validate_presence_of(:title) }
  it { should define_enum_for(:read) }
end
