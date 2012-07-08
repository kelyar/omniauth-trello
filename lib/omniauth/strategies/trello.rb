require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
  module Strategies

    class Trello < OmniAuth::Strategies::OAuth
      
      option :name, 'trello'
      
      option :client_options, {
        :access_token_path => "/1/OAuthGetAccessToken",
        :authorize_path => "/1/OAuthAuthorizeToken",
        :request_token_path => "/1/OAuthGetRequestToken",
        :site => "https://trello.com"
      }
      
      uid { 
        user_info['id']
      }
      
      info do 
        {
          :nickname => user_info['username'],
          :email => raw_info['email'],
          :name => user_info['fullname'],
          :first_name => raw_info['firstname'],
          :last_name => raw_info['lastname'],
          :description => user_info['about'],
          :image => raw_info['userpic_url'],
          :urls => {
            '500px' => raw_info['domain'],
            'Website' => raw_info['contacts']['website']
          }
        }
      end
      
      extra do
        {
          :raw_info => raw_info
        }
      end

      # Return info gathered from the flickr.people.getInfo API call 
     
      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('/v1/users.json').body)
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end

      # Provide the "Person" portion of the raw_info
      
      def user_info
        @user_info ||= raw_info.nil? ? {} : raw_info["user"]
      end
      
      def request_phase
        options[:authorize_params] = {:perms => options[:scope]} if options[:scope]
        super
      end
    end
  end
end
