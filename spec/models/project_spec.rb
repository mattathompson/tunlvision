require "spec_helper"

describe Project do
  %i(title client deadline user description).each do |field|
    it "requires a #{field}" do
      project = build :project, field => nil
      expect( project.valid? ).to be(false)
    end
  end
end
