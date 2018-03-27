# frozen_string_literal: true

class ContactController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new contact_params

    if @contact.valid?
      ContactMailer.contact_us(@contact).deliver_now
      redirect_to new_contact_url, notice: 'Message received, thanks!'
    else
      render :new
    end
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :body)
  end
end
