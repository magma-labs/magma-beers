# frozen_string_literal: true

class ContactController < ApplicationController
  def new
    @contact = Contact.new
  end
  def create
    redirect_to new_contact_url, notice: "Message received, thanks!"
  end
end
