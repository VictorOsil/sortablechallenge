# Challenge Mindera

# required

Ruby 2.4 or higher

Gems:
- cucumber
- capybara
- rspec
- selenium-webdriver

Drivers:
- geckodriver
- chromedriver

    **Download drivers using Homebrew:
    - brew cask install chromedriver
    - brew install geckodriver

    or:
    - http://chromedriver.chromium.org/downloads
    - https://github.com/mozilla/geckodriver/releases/tag/v0.24.0

#Clone project
git clone https://github.com/VictorOsil/challengeMandera.git

#Install gems
Run command 'bundle install'

#Run tests
Run command 'bundle exec cucumber'
    Obs: Chrome is set as default in cucumber.yaml . It can be changed to firefox in the same file or simply execute the command 'bundle exec cucumber -p firefox'

#Results
After running the test the report is generated in the path 'log/reports'
The screenshot can be find in 'log/shots'