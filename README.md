# Challenge - Mindera

**Required**
Ruby 2.4 or higher

**Gems:**
- cucumber
- capybara
- rspec
- selenium-webdriver

**Drivers:**
- geckodriver
- chromedriver

    **Download drivers using Homebrew:**
    - brew cask install chromedriver
    - brew install geckodriver

    or:
    - http://chromedriver.chromium.org/downloads
    - https://github.com/mozilla/geckodriver/releases/tag/v0.24.0

**Clone project**
git clone https://github.com/VictorOsil/challengeMandera.git

**Install gems**
Run command 'bundle install'

    OBS: if the command above does not return success, do as follow and try again:

    "brew install rbenv ruby-build

    echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile

    source ~/.bash_profile

    rbenv install 2.4.3
    rbenv global 2.4.3
    ruby -v

    gem install bundler"

**Run tests**
OBS: After running the application as described on "https://bitbucket.org/mindera/qa-sortable-challenge/src/master/"

- Run command 'bundle exec cucumber'

    Obs: Chrome is set as default in cucumber.yaml . It can be changed to firefox or chrome-headless in the same file or simply execute the command 'bundle exec cucumber -p firefox'

**Results**
After running the test the report is generated in the path 'log/reports' (work best on Chrome)
The screenshot can be find in 'log/shots'

**Docker**
Commands:

- docker build -t sortablechallenge .
- docker run -v {project_path}:/cucumber sortablechallenge cucumber features/sorting.feature

    Ex: docker run -v /Users/Victor/Documents/Victor/sortablechallenge:/cucumber sortablechallenge cucumber features/sorting.feature