class Rolodex
	@ids = 1001

	def intialize
		@contacts = [] 
	end

	def add_contact(contact)
		contacts.id = @@ids
		@contacts << contact 
		@@ids += 1
		contact
	end
end 