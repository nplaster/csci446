atom_feed do |feed|
  feed.title "Who bought #{@animal.name}"

  feed.updated @latest_foster_parent.try(:updated_at) 

  @product.foster_parents.each do |foster_parent|
    feed.entry(foster_parent) do |entry|
      entry.title "Foster Parent #{foster_parent.id}"
      entry.summary type: 'xhtml' do |xhtml|
        xhtml.p "Shipped to #{foster_parent.address}"
        xhtml.table do
          xhtml.tr do
            xhtml.th 'Name'
          end
          foster_parent.line_items.each do |item|
            xhtml.tr do
              xhtml.td item.animal.name
            end
          end
        end
      end
      entry.author do |author|
        author.name order.name
        author.email order.email
      end
    end
  end
end