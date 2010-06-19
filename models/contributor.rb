require 'net/http'
require 'yaml'

class Contributor
	def Contributor.all
		retval = []
		tree = YAML.parse(Net::HTTP.get_response(URI.parse('http://github.com/api/v2/yaml/repos/show/atheken/norm/contributors/')).body)
		for y in tree["contributors"].children
			c = Contributor.new
			
			if y[:name] != nil
				c.name = y[:name].value
			else 
				if y[:login] != nil
					c.name = y[:login].value
				else
					c.name = "Anonymous Benefactor"
				end
			end
			if y[:gravatar_id] != nil
				c.gravatar_id = y[:gravatar_id].value 
			end
			if y[:blog] != nil
				c.website =  y[:blog].value 
			end
			if y[:contributions] != nil
				c.commits = y[:contributions].value.to_i
			else
				c.commits = 1
			end
			
			retval.push(c)
		end
		retval = retval.sort{|r,l|l.commits <=> r.commits}
		return retval
	end
	
	attr_accessor :name
	attr_accessor :gravatar_id
	attr_accessor :website
	attr_accessor :commits
end