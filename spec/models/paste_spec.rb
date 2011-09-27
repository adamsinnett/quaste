require 'spec_helper'

describe Paste do
  it "accepts input" do
  	@paste = Factory(:paste)
  	@paste.should be_valid
  end
  it "requires input" do
  	@paste = Paste.new(:body=>"")
  	@paste.should_not be_valid
  end
  it "creates a short url" do
  	@paste = Factory(:paste)
  	@paste.permalink.should_not be_nil
  end
  it "creates a unique short url" do
  	@paste1 = Factory(:paste)
  	@paste2 = Factory(:paste)
  	@paste1.permalink.should_not == @paste2.permalink
  end
end
