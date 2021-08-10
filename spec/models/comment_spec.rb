require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:photo) }

    it { should belong_to(:author) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:author_id) }

    it { should validate_presence_of(:body) }

    it { should validate_presence_of(:photo_id) }
  end
end
