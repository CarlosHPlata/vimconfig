This section of the wiki will drive you to the Backend Architecture and
how to start doing changes to a Process Tempo project.

## Node JS Version

**<big>v 14.17.1 LTS</big>**

## If you are using Windows

Install the following package globally so it will let you run the API
Project with environment variables

``` md
npm install -g win-node-env
```

## Folder Structure

Based on the [hexagonal architecture (see Architecture
Principles)](Architecture_Principles "wikilink"), we will use the next
folders:

``` md
+-- src
|    +-- moduleNameFolder
|        +-- core
|            +-- dto
|            +-- entities
|            +-- interfaces
|                +-- repositories
|                +-- ports
|            +-- services
|
|        +-- infrastructure
|            +-- controllers
|            +-- repositories
|            +-- ports
|
|        moduleName.module.ts
|
|    +-- otherModuleFolder
...
```

## Start a new Microservice Project

1.  Make sure you are using the correct version of [Node
    JS](Backend_Startup_Guide#node_js_version "wikilink") Required for
    Micro Services.
2.  Go and pull the last version of [Base
    Project](https://bitbucket.org/phil_meredith/pt4-ms-baseproject/src/master/)
    (if you don't have access request it with your project lead)
3.  Clone the new repo where you want to start a new Microservice.
    (request repo with your project lead and admin permissions)
4.  Copy the content from pt4-ms-baseproject to the new pt4-ms repo.
    1.  **DO NOT COPY:** **<u>NODE\_MODULES</u>**, **<u>.GIT</u>**.
5.  NPM Install.
6.  Change **package.json** Project name.
7.  Change **main.ts** swagger configuration to your project.
    1.  Change title and description.
    2.  Change tags.
8.  run the project to check if it compiles.
9.  Commit and push your changes to Master Branch.
    1.  use as commit message: <u>**chore: initial commit**</u>
10. Go to Bitbucket repo page.
11. Go to branches and create **develop** branch from **master**
12. Go to Repository Settings:
    1.  Add all users to the repo access on User Repository Access with
        write permissions
        1.  Add your Project Lead and CI/CD Developer as Admins
    2.  Go to branching model
        1.  Set Development branch to:
            1.  Use specific branch
            2.  select develop branch
        2.  Set production branch to: Use main branch
    3.  Go to Merge strategies and set it to Squash
    4.  Go to Branch Permissions
        1.  Add a new branch permission:
            1.  Select by type
                1.  Choose development branch
            2.  Set write permissions to all Admins of the repo
            3.  Set merge via pull request to Everybody
            4.  Select: Check for at least 1 approval\\
            5.  Select: Check for at least 1 approval from default
                reviewers
        2.  Add a new branch permission:
            1.  Select by type
                1.  Choose Production branch
            2.  Set write permissions to all Admins of the repo
            3.  Set merge via pull request to all Admins of the repo
    5.  Go to Default reviewers and add your Project Lead
13. Contact your CI/CD Developer to set new CI Rules for the new Repo

### Modules
