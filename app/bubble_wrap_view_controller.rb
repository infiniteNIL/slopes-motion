class BubbleWrapViewController < UIViewController
  extend IB

  outlet :tableView, UITableView

  def viewDidLoad
    super
    @pages = []
  end

  def viewDidAppear(animated)
    super

    @pages = []
    SVProgressHUD.showWithStatus 'Loading Pages…'

    BubbleWrap::HTTP.post("https://artorius.backpackit.com/ws/pages/all",
                          payload: {token: BACKPACK_API_TOKEN}) do |response|
      rootXML = RXMLElement.elementFromXMLData(response.body)
      rootXML.iterate("pages.page", usingBlock:lambda do |e|
        attributes = Hash[[:title, :scope, :id].map {|name| [name, e.attribute(name.to_s)]}]
        @pages << BackpackPage.new(attributes)
      end)

      SVProgressHUD.dismiss
      tableView.reloadData

      save_pages
    end
  end

  def save_pages
    NanoStore.shared_store = NanoStore.store(:file, App.documents_path + "/pages.db") # persist the data
    begin
      NanoStore.shared_store.transaction do |store|
        @pages.each {|page| page.save}
      end
    rescue
      puts "An error occurred saving the pages"
    end
  end

  def tableView(aTableView, numberOfRowsInSection:section)
    @pages.length
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    reuseIdentifier = "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:reuseIdentifier)
    end

    cell.textLabel.text = @pages[indexPath.row].title
    cell
  end

end
