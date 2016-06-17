#!/bin/bash

#output file
exec > $PWD/"$HOSTNAME"_`date  +%F`.log

# include function
for function in `ls $PWD/functions/`
do
  . $PWD/functions/$function
done

#load modules
main()
{
  echo "->1. Base Information"
  base_information

  echo "->2. System Time"
  system_time

  echo "->3. File System"
  file_system

  echo "->4. Memory"
  memory
  

  echo "->5. System Load"
  system_load

  echo "->6. System Process"
  system_process

  echo "->7. Network State"
  network_state 

  echo "->8. System Log"
  system_log
  
  echo "->9. Service on boot"
  boot_service

  echo "->10. Authority Manage"
  authority_manage
  

  echo "->11. Gateway Checked"
  gateway_check
 
}

main
