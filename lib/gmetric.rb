module Ganglia
  class GMetric
    
    SLOPE = {
      'zero'        => 0,
      'positive'    => 1,
      'negative'    => 2,
      'both'        => 3,
      'unspecified' => 4
    }

    def self.pack(data)
      xdr = XDRPacket.new

      xdr.pack_int(0)                           # type gmetric
      xdr.pack_string(data[:type])              # one of: string, int8, uint8, int16, uint16, int32, uint32, float, double
      xdr.pack_string(data[:name])              # name of the metric
      xdr.pack_string(data[:val].to_s)          # value of the metric
      xdr.pack_string(data[:units])             # units for the value, e.g. 'kb/sec'
      xdr.pack_int(SLOPE[data[:slope]])         # sign of the derivative of the value over time, one of zero, positive, negative, both, default both
      xdr.pack_uint(data[:tmax].to_i)           # maximum time in seconds between gmetric calls, default 60
      xdr.pack_uint(data[:dmax].to_i)           # lifetime in seconds of this metric, default=0, meaning unlimited

      xdr.get_buffer
    end
  end

  class XDRPacket
    def initialize
      @data = []
    end

    def pack_int(data)
      
    end

    def pack_string(data)
      
    end

    def pack_uint(data)
      
    end

    def get_buffer
      @data.join
    end
  end
end
