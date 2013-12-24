# sinatra/json_body_params

Client side frameworks that send raw json POST and PUT requests (like Backbone.js) do not show up in sinatra parameters. Consider the following POST request ..

```
POST /comments.json HTTP/1.1
Host: domain.com
Content-Type: application/json
Content-Length: length

{"comment":{"content":"This will make working with Backbone way easier!"}}
```

.. from an ajax call like ..

```javascript
var data = { comment: { content: "This will make working with backbone way easier!" } };
$.post('/comments.json', JSON.stringify(data));
```

.. you might try to access the POST parameters ..

```ruby
params[:comment]
# => nil
```

.. but it doesn't work! With this extension, it behaves as expected:

```ruby
register Sinatra::JsonBodyParams

post '/comments.json' do
  params[:comment]
  # => { :content => "This will make working with Backbone way easier!" }
end
```

### Installation

1. Add `multi_json` to your `Gemfile`:

  ```ruby
  # Gemfile
  gem 'multi_json'
  ```

2. Copy `json_body_params.rb` into your project folder, where other modules live.

3. Require the file, through a relative path or via the load path, and then register it.

  ```ruby
  # app.rb
  register Sinatra::JsonBodyParams
  ```

There's an example at `example/app.rb`.