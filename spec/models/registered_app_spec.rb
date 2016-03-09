require 'rails_helper'

RSpec.describe RegisteredApp, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:url) }

end
