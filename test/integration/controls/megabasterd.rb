title "MegaBasterd Integration Test"

describe processes(Regexp.new("java.*-jar \./MegaBasterd\.jar")) do
  it { should exist }
end
describe port(5800) do
  its('protocols') { should include 'tcp' }
  its('addresses') { should include '0.0.0.0' }
end
