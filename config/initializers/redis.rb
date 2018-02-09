
if (Rails.env.dev? || Rails.env.test?)
	$redis = Redis.new(host: 'localhost', port: 6379)
else
	$redis = Redis.new(host: 'mc1.dev.ec2.memcachier.com', port: 11211)
end