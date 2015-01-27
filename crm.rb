require_relative './rolodex.rb'  
require_relative './contact.rb'

class CRM
	attr_reader :name

	def initialize(name)
		@name = name 
		@rolodex = Rolodex.new 
	end

	def print_main_menu
		puts "[1] Add a contact"
		puts "[2] Modify a contact"
		puts "[3] Display all contact"
		puts "[4] Display one contact"
		puts "[5] Display an attribute"
		puts "[6] Delete a contact"
		puts "[7] Exit"
		puts "Enter a number:"
	end

	def main_menu
		puts "Welcome to #{@name}"
		
		while true
			print_main_menu
			input = gets.chomp.to_i  
 			choose_option(input) 
 			return if input == 7
	end
end

	def choose_option(option)
		case option
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then display_contacts
		when 4 then display_contact
		when 5 then display_attribute
		when 6 then delete_contact
		when 7 
			puts "Goodbye!"
			return  
		else
			puts "Incorrect option, try again"
		end
	end

	def add_contact
		puts "Provides Contact Details"

		print "First Name: "
		first_name = gets.chomp

		print "Last Name: "
		last_name = gets.chomp

		print "Email: "
		email = gets.chomp

		print "Note: "
		note = gets.chomp
	
    new_contact = Contact.new(first_name, last_name, email, note)	
    @rolodex.add_contact(new_contact)
	end

	def modify_contact
		puts "Please provide contact id: "
		contact_id = gets.chomp.to_i

		@rolodex.display_one_contact(contact_id)
		
		puts "The contact will be modified, is this what you want to do?"
		modify_answer = gets.chomp.downcase

		if modify_answer == "yes"
			@rolodex.modify_contact(contact_id)
		
		elsif modify_answer == "no"
			print_main_menu
		
		else 
			puts "Incorrect option, try again"
		end 
	end

def display_contacts
		@rolodex.display_all_contacts
	end

	def display_one_contact
		puts "Please indicate the id of the contact you would like to show: "
		contact_id = gets.chomp.to_i
		@rolodex.display_one_contact(contact_id)
	end

	def display_attribute
		puts "Plese indicate the attribute you would like to display by: "
		puts "[1] First Name "
		puts "[2] Last Name "
		puts "[3] Email "
		puts "[4] Notes "
		attribute_option = gets.chomp.to_i
		@rolodex.display_attribute(attribute_option)
	end

	def delete_contact
		puts "Please indicate the id of the contact you would like to delete: "
		contact_id = gets.chomp.to_i 
		@rolodex.display_one_contact(contact_id)		
		@rolodex.delete_contact(contact_id)
		puts "The contact was deleted"
	end
end 

a_crm_app = CRM.new("Day 5 CRM App")   
a_crm_app.main_menu
