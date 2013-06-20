# sinatra/json_body_params

If you're using a client side framework that sends raw json POST and PUT requests (like Backbone.js does), then sinatra will not recognize the parameters.

Example:

### Example

If you recieve the following POST request

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
Then you might try to access the POST parameters like this in your application

```
params[:comment]
# => nil
```

But it doesn't work. With the extension, it's all fixed:

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
