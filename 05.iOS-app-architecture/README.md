## iOS app Architecture

1. Create a `UITableViewController` that holds a list of generated and encoded passwords
    * Each password has an account name and encryption code
    * Once you type the code, the encrypted password is decrypted
    * Implement a `UIViewController` for adding a password, encryption code and an option to create a random password
