# jhvalhei-oppg2
## How to use
Step into the "global" directory (for example 'cd global') and run these commands:

    - terraform init
    - teraform workspace create <name>
      - (not obligatory)
    - terraform plan -out=main.tfplan
    - terraform apply main.tfplan

## About the solution
The configuration creates infrastructure for an e-commerce platform. It has three environments: dev, stage and prod. With the tfvars files, it can be created environment spesific variables. There are four modules being used: app_services, database, networking and storage. All of these modules are called from the main.tf file in the deployments folder. The main.tf file in the deployments folder gets called as a module from the main.tf file in the global folder. This is where the provider information is and the backend block. The backend is stored in a storage account which is not configured in this project.

## CI/CD pipeline
When a branch is created locally and then published in the origin repository, it triggers the workflow "fmtandvalidate.yaml". This workflow does a simple review of the code by doing terraform fmt and validate. When this workflow is done, it triggers tfsec.yaml. This workflow scans the configuration for not optimal security. 

When these workflows are done, a pull request to one of the environment branches can be performed. When a branch gets merged to either dev or stage, it triggers the "deployDev.yml" or the "deployStage.dev" workflow. These workflows do a plan and apply according to it`s environment. When a pull request gets done to prod, it has to be manually approved. After approval, it will trigger "applyprod.yml". This does a plan and apply of the production environment.

## Report
### Folder structure
There was a couple of reasons why i chose this folder structure (alternative 2):

- **DRY** - This was mainly the reason why i picked alternative 2 over alternative 1. To not repeat code is a principle in infrastructure as code and i wanted to follow it. With alternative 2, i did not have to have environment spesific directoriess and therefore did not have to write much of the same code several places.
- **Terraform workspaces** - i wanted to use terraform workspaces. The differences between my environments was not too big, so i thought workspaces would be a good fit.
- **Not too complex** - i wanted to keep my configuration fairly simple. Im sure there are benefits to the other structures, but i thought for this project, it would be good with a not too complex one.
- **Fitted with CI/CD** - it fitted with the CI/CD pipeline i had in mind. I wanted to create workflows which did workspace specific deployment. Again, i thought this was good because the differences between the environment deployments was not big.

### Challenges
- **Deploy the correct infrastructure** - i found it difficult to make the correct configuration for the e-commerce infrastructure. I did not quite understand how all the components should be tied together.
- **tfvars files** - did not find out how to use the tfvars.dev, tfvars.staging and tfvars.prod. I think they are made for workspace specific variable values, but i did not get them to work.
- **interaction between folders** - in global/main.tf, I call deployments/main.tf as a module. I am not sure if this is correct, but i did not find another way.
- **learning by doing** - there was a lot of things i did not understand before i started, but i understood more when i started. Some of the mistakes I discovered late in the project was difficult to fix without starting over.

 ### Potential improvements or optimizations
 - **More automation in CI/CD** - there could be more automation in pull requests between environment branches
 - **Locked branches** - i could have locked the environmental branches, especially prod, so that you cant push directly to these branches. This would have been safer
 - **environment specific credentials on mssql server** - I could have made it so the credentials are different for each environment. Something easy in test environment and hard on the other ones.
