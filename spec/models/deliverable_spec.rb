require "spec_helper"

describe Deliverable do
  %i(title project).each do |field|
    it "requires a #{field}" do
      deliverable = build :deliverable, field => nil
      expect( deliverable.valid? ).to be(false)
    end
  end  
end
