  #!/bin/bash

  # make a new directory
  mkdir newDirectory

  # create a new file and add text to it
  echo "This is a new File!" > newDirectory/newFile.txt

  # change directory permissions
  chmod 666 newDirectory

  # see the contents of the new directory
  ls -l newDirectory