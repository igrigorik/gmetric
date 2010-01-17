require "helper"

describe Ganglia::GMetric do
  
  it "should pack GMetric into XDR format from Ruby hash" do
    result = "0000000000000006737472696e67000000000003666f6f00000000036261720000000000000000030000003c00000000"
    data = {
      :slope => 'both',
      :name => 'foo',
      :val => 'bar',
      :tmax => 60,
      :units => '',
      :dmax => 0,
      :type => 'string'
    }
    
    g = Ganglia::GMetric.pack(data)
    g.size.should == 48
    # g.hex.should == result
    
  end

end