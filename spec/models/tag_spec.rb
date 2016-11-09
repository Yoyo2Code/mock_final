require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { should have_many(:links) }
  it { should have_many(:link_tags) }
end
