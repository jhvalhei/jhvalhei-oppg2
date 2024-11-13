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

When these workflows are done, a pull request to one of the environment branches can be performed. When a branch gets merged to either dev or stage, it triggers the "deployStageAndDev.yml" workflow. This workflow does a plan and apply according to
 
