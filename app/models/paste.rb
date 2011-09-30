class Paste < ActiveRecord::Base
	@@alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.split(//)
	after_create  :create_permalink

	validates :body, :presence => true
	validates_uniqueness_of :permalink

	def to_param
		self.permalink
	end
	
	private
	def create_permalink
		# credit zumbojo @ https://gist.github.com/1073996
		shortURL = ''
  		base = @@alphabet.length
  		i = self.id
  		while i > 0
    		shortURL << @@alphabet[i.modulo(base)]
    		i /= base
 		 end
  		self.permalink = shortURL.reverse
  		self.save
	end
end
