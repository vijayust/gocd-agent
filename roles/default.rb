name "gocd-agent"
description "Installation of gocd-agent"
run_list "recipe[yum-update]","recipe[gocd-agent]","recipe[git]","recipe[ssh_key]"
