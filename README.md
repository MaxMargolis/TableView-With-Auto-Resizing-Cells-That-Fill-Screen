# TableView-With-Auto-Resizing-Cells-That-Fill-Screen
This a Swift implementation of a UITableViewController whose cells fill the screen and that supports Dynamic Type via a custom auto-resizing UITableViewCell subclass.
The main trick is to override a systemLayoutSizeFitting function in the custom UITableViewCell subclass to enable a minimum height.
