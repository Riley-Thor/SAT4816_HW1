
# Data Search and Extraction Script

This is a Bash script designed to **search** or **extract** specific data types (like phone numbers, URLs, emails, IP addresses, or usernames) from files within the current directory. 

## Features
- Supports **search** (`grep`) and **extraction** (`cat` + `grep`) operations.
- Uses regular expressions to match patterns for various data types.
- Works with common text files in the current directory.

## Prerequisites
- **Bash** 
- **grep** (with `-P` option for Perl-compatible regex)
- **strings** utility (for extraction)

## Usage
```bash
./script.sh <operation_type> <keyword>
```

### Arguments
- `<operation_type>`: 
  - `0` for searching data within files.
  - `1` for extracting data from files.
- `<keyword>`: Type of data to search or extract.

### Supported Keywords
| Keyword    | Description                   |
|------------|-------------------------------|
| `phone`    | Finds US phone numbers        |
| `url`      | Finds URLs (e.g.,             |
| `email`    | Finds email addresses         |
| `ip`       | Finds IPv4 addresses          |
| `username` | Finds usernames in `Last, First` format |

### Examples
1. **Search for phone numbers** in files:
   ```bash
   ./script.sh 0 phone
   ```

![Screenshot 2024-11-12 175703](https://github.com/user-attachments/assets/cf69a81c-897c-45b1-88ce-164ef47643bd)

   
2. **Extract emails** from files:
   ```bash
   ./script.sh 1 email
   ```

![Screenshot 2024-11-12 175736](https://github.com/user-attachments/assets/2fe4f4ac-0fd2-4c0c-adab-c8a49e1ba45f)


### Notes
- Ensure that you have files in the current directory that contain the data you want to search or extract.
- The script uses different regex options (`grep -P` for phones, `grep -E` for other types).
