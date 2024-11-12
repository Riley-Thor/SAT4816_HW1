# Drive Search

Drive Search is a Bash script for searching through files to find phone numbers, emails, IP addresses, URLs, and usernames.

## Installation

Download the drive_search.sh script into the folder you want to search through.

## Usage

./drive_search.sh <operation_type> <keyword>

```bash
# returns which files have a phone number in them.
./drive_search.sh 0 phone

# returns the emails found in the files.
./drive_search.sh 1 email
```

## Explanation

The operation type should be 0 (searching) or 1 (extracting). The keyword should be phone, email, ip, url, usernames depending on what you are looking for.
If you cannot run ./drive_search.sh then try running 

```bash
sudo chmod +x drive_search.sh
```
and you should be able to run it after that.