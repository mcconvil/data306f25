# Setting up and managing the Bucknell-DATA306-F25 github org and repos
library(usethis)
library(ghclass)
library(tidyverse)
library(janitor)

# Test my PAT
github_test_token()

# Check on org settings
org_sitrep("Bucknell-DATA306-F25")

# Check permission to none
org_set_repo_permission("Bucknell-DATA306-F25", repo_permission = "none")

# Load roster 
roster <- read_csv("data/GitHub Usernames - Sheet2.csv") %>%
  clean_names()
names(roster)
roster

# Send invites
#org_invite(org = "Bucknell-DATA306-F25", user = roster$git_hub_username)


# See members
org_members("Bucknell-DATA306-F25")
org_pending("Bucknell-DATA306-F25")


# Create template for work
repo_is_template("Bucknell-DATA306-F25/work")
repo_set_template("Bucknell-DATA306-F25/work")

# Distribution the work repos
org_create_assignment(
  org = "Bucknell-DATA306-F25",
  user = roster$git_hub_username,
  repo = roster$ind_repos,
  source_repo = "Bucknell-DATA306-F25/work",
  private = TRUE
)


###### Distribute Project 1 Group Repos
repo_is_template("Bucknell-DATA306-F25/project-template")
#repo_set_template("Bucknell-DATA306-F25/project1")



# distribution project 1 repos
org_create_assignment(
  org = "Bucknell-DATA306-F25",
  user = roster$git_hub_username,
  repo = roster$project_repos,
  team = roster$project_repos,
  source_repo = "Bucknell-DATA306-F25/project-template",
  private = TRUE
)



# distribution project 1 repos
org_create_assignment(
  org = "Bucknell-DATA306-F25",
  user = project2$git_hub_username,
  repo = project2$prj2_grps,
  team = project2$prj2_grps,
  source_repo = "Bucknell-DATA306-F25/pkgDemo",
  private = TRUE
)