# terraform
Terraform repo for Infrastructure Management

## Steps to execute
1. Configure AWS credentials - https://us-east-1.console.aws.amazon.com/iam/home?region=us-east-1#/security_credentials/access-key-wizard
2. Execute aws configure
    ```
    % aws configure 
    AWS Access Key ID [None]: Enter AWS Access Key
    AWS Secret Access Key [None]: Enter AWS Secret Access Key
    Default region name [us-east-1]: us-east-1
    Default output format [json]: json
    ```
 4. Execute the terraform commands
      ```
      terraform init
      terraform plan
      terraform apply
      ```

## Jenkins
This repository illustrates the Jenkins installation using Terraform. Terraform code does the following
1. Create security group
  
2. Create t2.micro EC2 Instance type

   <img width="1196" alt="image" src="https://github.com/thunderbirdgit/terraform/assets/11564294/508e4911-194c-44aa-a130-f2302154948d">
  
3. Attach EBS volume to the EC2 instance

   <img width="1021" alt="image" src="https://github.com/thunderbirdgit/terraform/assets/11564294/4913a246-80b0-4722-9db4-d62877f13535">
   
4. Install Jenkins application

   <img width="1007" alt="image" src="https://github.com/thunderbirdgit/terraform/assets/11564294/2f3b8402-827d-4e17-88be-daf02b4fcbc5">
   
5. Install necessary plugins
   
   <img width="950" alt="image" src="https://github.com/thunderbirdgit/terraform/assets/11564294/7a924543-f049-414d-af36-513d64b9a1cb">
  
6. Access Jenkins through EC2 Public address
   
   <img width="621" alt="image" src="https://github.com/thunderbirdgit/terraform/assets/11564294/dc4f1bc1-7317-4ce5-a712-bef88b9cc347">
   <img width="1341" alt="image" src="https://github.com/thunderbirdgit/terraform/assets/11564294/5c16b02c-7284-463d-a673-ecc51335c4f7">
