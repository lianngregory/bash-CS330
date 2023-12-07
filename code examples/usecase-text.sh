  #!/bin/bash

  # count file types in user's current directory
  find "$PWD" -type f | awk -F'.' '{print $NF}' | sort | uniq -c | sort -nr | \
    while read -r count fileType; do
      echo "Files of type $fileType: $count"
    done