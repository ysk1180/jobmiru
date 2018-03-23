if ENV['RACK_ENV'] == 'production'
  Jobmiru::Application.config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
    r301 %r{.*}, 'https://www.jobmiru.com$&', :if => Proc.new {|rack_env|
      rack_env['SERVER_NAME'] == 'jobmiru.herokuapp.com'
    }
  end
end
