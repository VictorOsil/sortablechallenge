class SortingPage
    include Capybara::DSL

    def url
        visit 'http://localhost:3000'
    end

    def findItems
        $array = [ ]
        page.all(:css, 'li').each do |el|
            $items = $array.push(el.text)
        end
        $arrayItems = $items.each {|arel| arel}
    end

    def sortAscending
        SortingPage.new.findItems
        $ascendingInitial = $arrayItems.sort
        $count = $ascendingInitial.count
        SortingPage.new.dragItem($arrayItems, $ascendingInitial, 0)
        if($count > 1)
            @newIndex = 0
            while $count > @newIndex + 1  do
                SortingPage.new.findItems
                $ascending = $arrayItems.sort
                @newIndex = @newIndex + 1
                SortingPage.new.dragItem($arrayItems, $ascending, @newIndex)
            end
        end
    end

    def dragItem(returned, sorted, index)
        if(returned.at(index) != sorted.at(index))
            $position = returned.index(sorted.at(index))

            element = find("div[id='app']").find('li', text: returned.at($position))
            target = find("div[id='app']").find('li', text: returned.at(index))
            element.drag_to target
        end
    end

end