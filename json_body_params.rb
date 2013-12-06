require 'sinatra/base'
require 'multi_json'

module Sinatra
  module JsonBodyParams
    
    def self.registered(app)
      app.before do
        params.merge! json_body_params
      end
      
      app.helpers do
        def json_body_params
          unless @body_data
            begin
              str = request.body.read.to_s
              @body_data = MultiJson.load(str, symbolize_keys: true)
            rescue MultiJson::LoadError
              @body_data = {}
            end
          end
          @body_data ||= {}
        end
      end
    end
    
  end  
end