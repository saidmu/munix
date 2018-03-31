# Ansible Role  

## Ansible Role Hierarchy  

- roles/x/tasks/main.yml: 主函数，通过include包含在其中的所有任务将被执行 
- roles/x/handlers/main.yml: 所有包括其中的handlers将被执行  
- roles/x/vars/main.yml: 所有包括在其中的变量将在roles中生效 
- roles/x/meta/main.yml: roles所有依赖将被正常登入 
- roles/x/{files,templates,tasks}/(dir depends on task): 所有文件、模板都可以存在在这里 

