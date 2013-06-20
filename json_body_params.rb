require 'sinatra/base'
require 'multi_json'

module Sinatra
  module BodyData
    
    def self.registered(app)
      app.before do
        params.merge! body_data
      end
      
      app.helpers do
        def body_data
          unless @body_data
            begin
              str = request.body.read.to_s
              puts str
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