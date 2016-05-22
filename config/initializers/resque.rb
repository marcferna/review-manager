Resque.redis = (Rails.env.test? || Rails.env.development?) ? '127.0.0.1:6379' : ENV['REDISCLOUD_URL']
