# GMetric

A pure Ruby client for generating Ganglia 3.1.x+ gmetric meta and metric packets and talking to your gmond / gmetad nodes over UDP protocol. Supports host spoofing, and all the same parameters as the gmetric command line executable.

[http://www.igvita.com/2010/01/28/cluster-monitoring-with-ganglia-ruby/](http://www.igvita.com/2010/01/28/cluster-monitoring-with-ganglia-ruby/)

## Example: Sending a gmetric to a gmond over UDP

```ruby
Ganglia::GMetric.send("127.0.0.1", 8670, {
  :name => 'pageviews',
  :units => 'req/min',
  :type => 'uint8',
  :value => 7000,
  :tmax => 60,
  :dmax => 300,
  :group => 'test'
})
```

## Example: Generating the Meta and Metric packets

```ruby
g = Ganglia::GMetric.pack(
  :slope => 'positive',
  :name => 'ruby',
  :value => rand(100),
  :tmax => 60,
  :units => '',
  :dmax => 60,
  :type => 'uint8'
)

# g[0] = meta packet
# g[1] = gmetric packet

s = UDPSocket.new
s.connect("127.0.0.1", 8670)
s.send g[0], 0
s.send g[1], 0
```

### License

The MIT License, Copyright (c) 2009 Ilya Grigorik
