require 'rails_helper'

RSpec.describe Event, type: :model do
  it { is_expected.to belong_to(:registered_app) }
  it { is_expected.to respond_to(:name) }
end
