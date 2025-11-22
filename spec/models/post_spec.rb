require 'rails_helper'

RSpec.describe Post, type: :model do
  context "Association" do
    it { is_expected.to belong_to(:user)}
  end

  # belong_to
  it { should belong_to(:user)}
  it { is_expected.to belong_to(:user)}

end
