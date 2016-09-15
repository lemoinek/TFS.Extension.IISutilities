# IIS utilities 
Build and Release tasks to start/stop IIS services. 

### Parameters
##### IIS Server
The name of the server on which the IIS is running.
##### Action
The action you want to execute. You can choose:  
- Start Website  
- Stop Website  
- Restart Website  
- Start Application pool  
- Stop Application pool  
- Restart Application pool  

##### Name
The name of the website/application pool. For multiple services use ;  
example: AppPool1;AppPool2;AppPool3

##### UserName
Not required

##### Password
The password of the user to connect to the IIS server. Set sensitive fields to $(MySecretPassword), and define MySecretPassword in the Variables tab.
