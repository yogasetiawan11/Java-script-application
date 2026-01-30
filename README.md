# Implement security best practice in Git
Security is one of the crucial part in tech world this documentation demostrate how to Implement best security practice to Mitigate security risk in Git environment,

there's a lot of security attacks in this day and age, based on data on the Internet, security exist because of the Developer who build the system itself. some develper write 
``.env`` to store Credential Information like: Database Password, Secret and more. with this Information Developer commit this Information to Git (github or gitlab) where anyone who has access the repo can look at the secret and use it. To prevent this problem you can use **.gitignore** file.

the defaulr behaviour of Git is to track every single file on your machine and **.gitignore** tell your git to Ignore particular file and directory which contain the credential Information, so you create and list done all sensitive information within **.gitignore** . 
here are the most common files to Ignore whithin **.gitignore**
```sh
.env
.env.*
*.pem
*.key
id_rsa
terraform.tfstate
.terraform/
node_modules/
dist/
```