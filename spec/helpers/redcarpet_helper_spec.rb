require 'rails_helper'

describe RedcarpetHelper do
  describe "#markdown" do

    it "should receive new" do
      expect(Redcarpet::Markdown).to receive(:new).with(any_args)
      markdown(Hash.new)
    end
  end
end
