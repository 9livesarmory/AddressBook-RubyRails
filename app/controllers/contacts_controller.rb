class ContactsController < ApplicationController
	def index
		@contacts=Contact.order("name DESC")

		render "index"
	end

	def new
		render 'new'
	end

	def create
		contact = Contact.new(
      	:name => params[:contact][:name],
      	:address => params[:contact][:address],
      	:phone => params[:contact][:phone],
      	:email => params[:contact][:email])

		contact.save #save to db
    	#render(:text => contact.attributes) # Render contact's attributes

    	redirect_to("/index")
	end

	def show
		@id=params[:id]

		@contact=Contact.find_by(id: @id)
    	#render(:text => contact.attributes) # Render contact's attributes

    	# render(:contact => contact.attributes)
	end
end

