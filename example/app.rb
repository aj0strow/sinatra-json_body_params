require 'sinatra'
require_relative '../json_body_params'
register Sinatra::JsonBodyParams

post '/test' do
  params[:test].tap do |test_params|
    p test_params
  end.join(', ') + "\n"
end

__END__

You can test it out with the following curl command:

curl -X POST -H "Content-Type: application/json" \
-d '{"test": [ "this", "should", "show", "up" ]}' \
localhost:4567/test 