=begin
Main file for listing out different urls/paths a customer can go to.
Points to file in folders to the left. pages#about -> pages/about.html.erb
=end

Rails.application.routes.draw do
  devise_for :users
 root to: 'pages#home'
 get 'about', to: 'pages#about'
 resources :contacts, only: :create
  # ^This auto generated many lines when you check 'rails routes' in terminal.
  # including /new_contact, edit_contact, and many more.  
 get 'contact-us', to: 'contacts#new', as: 'new_contact'
   # ^Changes URL from contacts/new to contact-us
 get 'my-hubspot', to: 'pages#myhubspot'
 end

# Get requests are the most common requests, sent anytime you go to x.com 
 