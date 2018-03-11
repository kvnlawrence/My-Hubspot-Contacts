# My Hubspot
Project goal: Pulling contacts from the Hubspot API

## Creating "My HubSpot" page
1. Routes file ([routes.rb](https://github.com/kvnlawrence/MyHubspot-Contacts/blob/master/config/routes.rb)),
added: 

```
get 'myhubspot', to: 'pages#myhubspot'
```
 
2. Pages Controller ([pages_controller.rb](https://github.com/kvnlawrence/MyHubspot-Contacts/blob/master/app/controllers/pages_controller.rb)), added:

```
def myhubspot
  end
```

3. Created view file ([myhubspot.html.erb](https://github.com/kvnlawrence/MyHubspot-Contacts/blob/master/app/views/pages/myhubspot.html.erb)).

4. Add rails link to myhubspot.html.erb in ([application.html.erb](https://github.com/kvnlawrence/MyHubspot-Contacts/blob/master/app/views/layouts/application.html.erb)):

```
<li><%= link_to "My HubSpot", myhubspot_path %></li>
```


## Connected to HubSpot API
1. Installed [Hubspot REST API Gem](https://github.com/adimichele/hubspot-ruby)
2. Created initializer ([hubspot.rb](https://github.com/kvnlawrence/MyHubspot-Contacts/blob/master/config/initializers/hubspot.rb)) w/ HubSpot API key

## Improving ([My Hubspot Page](https://github.com/kvnlawrence/MyHubspot-Contacts/blob/master/app/views/pages/myhubspot.html.erb)) page 
1. Created table to show contacts using HTML, CSS, and Bootstrap
2. Embedded Ruby to retrieve all contacts from hubspot API:
```
<div class ="container-fluid text-center">
    <div class="row">
        <div class="col-md-12">
            <h1>Contacts</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <table class="table table-striped table-bordered">
                <thead class="thead">
                    <tr>
                        <th scope="col" >First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Company</th>
                        <th scope="col">Email</th>
                        <th scope="col">City</th>
                    </tr>
                </thead>    
                <tbody>      
                    <% 
                        ( Hubspot::Contact.all({ property: ['email', 'lastname', 'company', 'firstname', 'city'] }) ).each do |contact|
                        info = contact.properties
                    %>
                        <tr>
                            <th scope="row"><%= info[:firstname] %></th>
                            <th scope="row"><%= info[:lastname] %></th>
                            <th scope="row"><%= info[:company] %></th>
                            <th scope="row"><%= info[:email] %></th>
                            <th scope="row"><%= info[:city] %></th>
                        </tr>
                    <% end %>
                </tbody>
            </table>
        </div>
    </div>
</div>
```
