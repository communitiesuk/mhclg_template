# Using with Rails

## Add to Gemfile

Add `hackney_template` to your app's `Gemfile`:

```ruby
gem 'hackney_template', git: 'https://github.com/unboxed/hackney_template'
```

In a production system you'll want to pin a more specific reference for stability. For example (where `c4400e` is the hash of the specific commit to want to pin to):

```ruby
gem 'hackney_template', git: 'https://github.com/unboxed/hackney_template', ref: 'c4400e'
```

## Use the layout

Add this line to the bottom of your application layout view (usually in `app/views/layouts/application.html.erb`):

```erb
<%= render file: 'layouts/hackney_template' %>
```

## Customise the template

`hackney_template` provides blocks you can insert content into, to customise the basic layout.

For example, to set a `<title>` for your page you can set content for the `:page_title` block, and it will be inserted into the `hackney_template` layout.:

```
<% content_for :page_title, "My page title" %>
```

Or to add content to `<head>`, for stylesheets or similar:

```
<% content_for :head do %>
  <%= stylesheet_link_tag 'application', media: 'all' %>
  <%= csrf_meta_tags %>
<% end %>
```

Check out the [full list of blocks](template-blocks.md) you can use to customise the template.
