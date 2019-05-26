Before do
    @sorting_page = SortingPage.new
    # page.current_window.resize_to(1280, 800)
    # page.driver.browser.manage.window.maximize
end

After do
    Capybara.reset_sessions!
end

After do |scenario|
    nome_cenario = scenario.name.tr(' ','_').downcase!
    nome_cenario = nome_cenario.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, '_')
    screenshot = "log/shots/#{nome_cenario}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', 'Click here to see the evidence!')
end