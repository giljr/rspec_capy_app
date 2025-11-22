
# rspec_capy_app

Rails 7 + RSpec + Capybara + Devise + Solargraph setup
Alias: br

### 🎬 Get started
```bash
git clone https://github.com/giljr/rspec_capy_app.git
cd rspec_capy_app
```
### 🧰 Prerequisites
```
Ruby 3.4.7

Rails 8.1.1

Editor with Solargraph support (for IDE/VSCode)
```
### ✅ Setup

Install gems:
```ruby
bundle install
```

Prepare the database:
```ruby
bin/rails db:create db:migrate
```

Run Solargraph (for code‑navigation, autocomplete):
```
bundle exec solargraph scan
```
### 🧪 Testing

Use RSpec + Capybara system/feature specs:
```ruby
bundle exec rspec
```
or   (after run `bundle binstubs rspec-core`):
```
bin/rspec
```

You will find example tests under spec/ demonstrating:
```
Authentication flows with Devise

System tests using Capybara to simulate user interactions

Model/controller specs with RSpec
```
### 🔧 Alias “br”

This project defines a shell alias br (for example: br rspec) for convenience. Add the following to your shell profile (~/.bashrc, ~/.zshrc):
```
alias br='bin/rspec' or 'bundle exec rails'
```

Then you can run:
```
br 
br spec/models/post_spec.rb
br spec/requests/posts_spec.rb -fd
```

### 📚 Why this stack?
```
Devise simplifies authentication in Rails apps.

RSpec is the de‑facto testing framework in modern Rails apps. 

Capybara allows writing high‑level specs that simulate real user behavior in browser‑style tests. 

Solargraph enhances developer productivity by providing code‑completion, inline documentation, and static analysis in Ruby projects.
```
Combining these gives you a robust foundation: a Rails app that is well‑tested, maintainable, and developer‑friendly.

### 🧭 Structure overview
```
app/
spec/           ← RSpec + Capybara tests  
config/
...

spec/models, spec/controllers, spec/system etc.
```
Devise setup in `app/models/user.rb` and configuration in `config/initializers/devise.rb`

Solargraph configuration is under `.solargraph.yml`

### 🤝 Contributing

Feel free to fork, open issues or pull requests. Keep your additions aligned with the tutorial’s goal: clear, maintainable Rails + Test + Tooling setup.

### 📄 License

This project is open‑source—use it freely in your own tutorials or apps.