require 'spec_helper' 

describe "Graph" do
  it "can be initialized as an empty object" do
      g = Graph.new 
      g.should_not be_nil
  end
end
