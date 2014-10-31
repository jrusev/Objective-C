## Storyboards

Jumping from screen to screen in an iOS Application

1. Create an application for keeping lists of notes:
    * Each notes list has a title and category
        * Show the title + category of the lists in a UITableViewController
        * Add an "Add new list" button for creating new list
        * Add a remove button for a list
            * When the button is clicked and the list has notes, ask the user to confirm
    * When clicking a list, go to another scene, showing the list's title and notes
        * Provide add and remove note functionality
    * When clicking a note, show another scene with the note details
        * The note details should have editable title, description and optional date (in the future)
    * Create a Note and List classes
    * Create a ListsData class that provides functionality for working with lists
        * Hold an instance of this class in the ViewControllers
    * Use storyboards, segues and unwinding segues
