class Podio::Search < ActivePodio::Base
  property :type, :string
  property :id, :integer
  property :title, :string
  property :created_on, :datetime
  property :link, :string
  property :space, :hash
  property :org, :hash
  property :app, :hash
  
  has_one :created_by, :class => 'ByLine'
  
  
  class << self
    def in_org(org_id, words)
      response = Podio.connection.post do |req|
        req.url "/search/org/#{org_id}/"
        req.body = words
      end

      list response.body
    end    

    def in_space(space_id, words)
      response = Podio.connection.post do |req|
        req.url "/search/space/#{space_id}/"
        req.body = words
      end

      list response.body
    end    
  end
  
end