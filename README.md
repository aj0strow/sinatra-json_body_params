# sinatra/json_body_params

If you're using a client side framework that sends raw json POST and PUT requests, then sinatra will not recognize the parameters.

Example:

### Example

If you recieved the following POST request

```
POST /comments.json HTTP/1.1
Host: domain.com
Content-Type: application/json
Content-Length: length

{"comment":{"content":"This will make working with Backbone way easier!"}}
```

From an ajax call like

```javascript
var data = { comment: { content: "This will make working with backbone way easier!" } };
$.post('/comments.json', JSON.stringify(data), callback);
```

Why would you stringify perfectly good query json? Not sure, but Backbone does for example. Without the extension the parameter is not recognized

```
params[:comment]
# => nil
``` 

With the extension, it works

```
register Sinatra::JsonBodyParams

post '/comments.json' do
  params[:comment]
	# => { :content => "This will make working with Backbone way easier!" }
end
```

### Installation

Add the following dependency to your `Gemfile`:

```ruby
gem 'multi_json'
```

Copy the file `json_body_params.rb` into your project folder, with other modules.

Require the file, through a relative path or via the load path.

`register Sinatra::JsonBodyParams` in the main application.
