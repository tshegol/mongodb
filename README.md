# mongodb

# Method 1
- Is a Bash Script that create an AWS instance on mongodb, the image is from docker hub

to run the bash script use
<code>
 bash start.sh
<code/>
  
# Method 2
Here we are using:

- Packer v1.3.1
- Ansible
- Terraform v0.11.10
- Docker 18.06.0-ce
- MongoDB 4.0.7
- Bash Scripting

run the following command inside the Packer/ directory 
<code>
bash start.sh  
<code/>
  
Once packer finishes its process then we need to run terraform commands inside the Terraform/ directory: 

- <code> terraform init  <code/>
  
  
Once done, we need to execute the following:
- <code> terraform plan <code/>
  
Next we need to execute the following command to tell terraform to create our infrastructure in aws.
- <code> terraform apply <code/>
  
