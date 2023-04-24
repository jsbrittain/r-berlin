# r-berlin

[![R](https://github.com/jsbrittain/r-berlin/actions/workflows/r.yml/badge.svg)](https://github.com/jsbrittain/r-berlin/actions/workflows/r.yml)

#### This repository provided training resources during a lab retreat and is not maintained

# Github workflow

- Create an issue and discuss
- Fork the repository
- Make changes on a feature branch
- Submit a Pull Request to the upstream repository

# Training walkthrough

During the live session the following topics were covered:
1. [A brief overview of version control](#a-brief-overview-of-version-control)
1. [A note on configuring access to github](#a-note-on-configuring-access-to-github)
1. [Creating a new repository (as owner/maintainer)](#creating-a-new-repository-as-owner/maintainer)
1. [Raising an Issue](#raising-an-issue)
1. [Forking an existing repository](#forking-an-existing-repository)
1. [Opening a repository in RStudio](#opening-a-repository-in-rstudio)
1. [Creating a feature branch](#creating-a-feature-branch)
1. [Committing and pushing changes](#committing-and-pushing-changes)
1. [Opening a pull-request](#opening-a-pull-request)
1. [A brief overview of code review](#a-brief-overview-of-code-review)
1. [Testing strategies](#testing-strategies)
1. [Using the `testthat` library](#using-the-testthat-library)
1. [Mocking functions for testing](#mocking-functions-for-testing)
1. [A quick introduction to Github Actions](#a-quick-introduction-to-github-actions)

## A brief overview of version control

Version control is helpful to track progress in your work, allows you to recover quickly and easily from breaking changes that are inadvertently introduced into your code, and has become the standard for best-practice software collaboration online. The open-source community relies on this collaboration to build its software, and even well-established projects welcome [Issues](https://github.com/jsbrittain/r-berlin/issues) being raised that will help them improve the overall quality of their products.

Some terminology:
- [**git**](https://git-scm.com/) is a version control system (*alternatives do exist*)
- [**github**](https://github.com/) is a very popular git-based repository hosting service

## A note on configuring access to github

You can freely 'clone' (download) any public repository from github with only your login email and password. However, in 2021 github removed support for password authenication if you want to make changes to a repository, i.e. if you want to 'push' changes to github. Due to this, if we want to make changes to a repository we need setup a Personal Access Token between your computer and github. Thankfully this is a one-time process for each computer that you use.

The full instructions are available on the [github support pages](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) (which includes pictures of the relevant steps), but a brief overview is:
- On MacOS, open a [`Terminal`](https://support.apple.com/en-gb/guide/terminal/apd5265185d-f365-44cb-8b09-71a064a42125/mac) and type `ssh-keygen -t ed25519 -C "your_email@example.com"` (you can select the defaults for most questions, or add additional layers of security if you prefer). This creates a pair of tokens, one public and one private, that allow you to communicate securely with github.
- Copy the contents of `~/.ssh/id_ed25519.pub` (**note the 'pub' file extension, do not share the contents of the non-pub file**) into the clipboard
- Navigate to Github, select `Settings` from the profile drop-down on the right. Then, select `SSH and GPG keys` from the menu on the left; click `New SSH Key`, give it a title (such as `my-laptop`) and paste the whole contents of `~/.ssh/id_ed25519.pub` into the 'Key' field. Add the SSH key and you should be good to go.

## Creating a new repository (as owner/maintainer)

Creating a new repository for your own projects is straightforward:
- Goto `Your repositories` (accessible via your profile dropdown list in the upper-right corner of github); Click `New`
- *name* - Enter a repository name and (optional) description
- *visibility* - Specify whether you want your repository to be publically accessible, or accesible only to a limited number of people (there are some limitations here using the free services provided by github)
- *README* - It is a good idea to initialise the repository with a README file
- *.gitignore* - If your repository will use a common coding language (such as R) then it is a good idea to select the relevant .gitignore option from the drop-down box. The .gitignore file tells git which files to ignore and hence will not be uploaded to github (it is a text file so you can open and view its contents if you like). This will include files such as your (computer-specific) RStudio project file, the .Rhistory file (which is a potential security risk as it exposes your command history), or virtual environments (if using Python) which are computer-specific and can be very large.
- *license* - Although often overlooked, providing public-access code without a license means that you are allowing anyone to do anything with your code, without the need to even acknowledge you. As such it is good practise to specify a license straight away to avoid this scenario. The 'MIT' license is a popular choice for open-source development (but check this for your specific use-case).
- Create your repository!

## Raising an Issue

The purpose of this walkthrough was to demonstrate the typical process encountered when contributing to open-source software. This begins when you use the software and either 1) discover a bug, or 2) think up a new feature that you think would be good to include. In either case you want to raise an [Issue](https://github.com/jsbrittain/r-berlin/issues) describing the bug/feature, and providing some additional information to the maintainer of the repository, such as a justification of the feature, or a minimal code sample that they can use to recreate your bug. Remeber that they do not necessarily expect you to fix the bug - some repositories employ teams of engineers that will do this, but you can offer to fix it or, if they are a smaller repository, they may ask if you are able and willing to provide the fix yourself.

## Forking an existing repository

Once you know you want to contribute a change to the repository you will need your own copy to change. This is because you cannot submit 'Pull Requests' unless you are added as a 'Contributor' or a 'Collaborator' on a project. Forking provides a more accessible mechanism for open-source development.

Go to the [repository home page](https://github.com/jsbrittain/r-berlin) and select 'Fork'. This will allow you to create your own copy of the repository (including, incidentally, its entire version control history). You can now edit this version of the code and then either 1) keep your changes separate from the original repository - for example, if you want to change the code for your specific use-case - or 2) merge your changes through a pull-request with the original repository.

Note that as the originating repository updates, you will be able to update your own repository with changes from that repository ('Sync' button on your repositories homepage), keeping you up-to-date with any ongoing development.

## Opening a repository in RStudio

Now that you have a repository to open and pull from, open RStudio, select `File` - `New Project`. Create a new `Version Control` project, choose `Git`, enter the repository URL, give it a folder name, and select where to save that folder. Note that the 'Repository URL' should be the SSH URL form *your* (forked) repository. To find this, navigate to your repository on github, select the green `Code` button - from the `Local` tab (not Codespaces) select `SSH` and then copy/select the URL (that begins `git@github.com:/`).

As is good practise, `Pull` any recent changes from the server as soon as you open the project in RStudio (Select `Pull` from the `Git` tab that appears alongside `Environment` in the top-right pane [by default]).

You now have a forked repository and pulled it onto your computer for local development.

## Creating a feature branch

Git makes extensive use of branches to keep features that are in development separate from one another until they are ready to be merged onto the `main` branch. A quick note: there is nothing functionally special about the `main` branch, except that it is (by convention) the `trunk` from which feature branches extend.

You may wonder why we need to create a Feature Branch in this case (since you already have a forked repository), the concept is that you should fully develop your feature first, even in your forked repository, before attempting to merge. This way, you can develop multiple features/bug-fixes at the same time without them colliding, or simply keep the 'original' version entact (so that you can continue to use it) while you fix any issues (and develop the necessary tests) for your new feature to be accepted. Once your feature has been added to the upstream/originating repository, you can 'Sync' and update your Forked copy so that it stays up-to-date with the official version.

To create a branch in RStudio, simply click the 'New Branch' button and give it a name. A useful convention is to name the branch using the formulation `issue-{#}-{short_description}`, where `{#}` refers to the issue number raised in the upstream repository, e.g. `issue-43-add_tinsel`.

Now write your code - and don't forget to include tests to demonstrate that your code actually does what it is intended to do (more on this below...).

## Committing and pushing changes

Once your changes are made and you are ready to commit those change (remembering that a 'commit' is a snapshot of the repository at a moment in time), you can select the files you want to include in the commit (from the `Git` tab in the upper-right panel), and click `Commit`. This will open a new window where you can review the changes that you are including in that particular commit (try to keep unrelated changes in separate commits as they will be easier to find [if necessary] later on). Give the commit a (short) message that reflects the contribution, then click `Commit`.

A commit 'snapshot' has now been taken of your `git` repository, but you haven't yet uploaded it to `github`. To do this, `Push` your changes to github (the green up-arrow in the `Git` tab). Note that it is good practise to always 'pull' before 'pushing' so that you are fully up-to-date before submitting changes.

***If you ever encounter a problem 'pulling' from github in RStudio***, it is likely that your repository if out-of-date with that on the server. The solution provided by RStudio is to 'Pull with Rebase' (click the dropdown button next to the blue downward-facing pull arrow in the Git tab of RStudio). This will take your feature branch and ***move its origin*** from where it was, to the most recent commit on the main branch, i.e. it will apply all of your changes to the most recent version of the repository, instead of from where you actually started from.

For those interested, here is a good article on [merging vs rebasing](https://www.atlassian.com/git/tutorials/merging-vs-rebasing).

## Opening a pull-request

Once your code is ready and has been committed and pushed to your (forked) repository, then you are ready to merge those changes into the main branch. You need to do this through the github web interface, so browse to your github repository.

If you recently commited then you will see a large message asking if you want to 'Compare & pull request' - click this. If you did not commit recently then go to the `Pull Requests` menu, click on `New Pull Request`.

You can now choose whether you want to merge onto your own (forked) main branch, or the main branch of the originating / upstream repository. Choose the latter in this case. Your feature branch should be merging onto the main branch.

A pull-request is a conversation between you and the maintainer (or the maintainers' team) where you can *suggest* changes to their repository, but it is perfectly normal for them to ask for changes (much like manuscript revisions). If the code you have provided is 'clean' (easy to read and understand, well formatted) and provided with test code, then you should be fine. Nevertheless, the repository may obey certain conventions (filenames, etc) that they will ask you to conform to, so don't be surprised if they ask for changes (a fair number of open-source Pull Request go stale because the requester was not expecting to have to follow-up their contribution with, for example, proper testing to demonstrate code suitability).

If you need to make/add changes, simply commit on your feature branch and those commits will automatically appear in the pull request. You can then 'request review' or message the maintainer (use @username in a message) to let the maintainer know that the pull request is ready.

## A brief overview of code review

Code review, as the name suggests, involves the maintainer (or collaborator/contributor) looking over the submitted code for correctness. Review can include providing feedback on specific lines of code, or more general comments. This is done through the Pull Requests screen.

Review outcomes are:
- **Approve**
- **Request changes**
- **Comment** (i.e. does not provide a specific decision)

Code review is generally used to ensure that the appropriate procedures for that repository are followed. For example: Have unit tests been provided to demonstrate the test case? If a bug-fix, has a new unit test been added that first demonstrates the bug, and is now resolved by the code changes? Is the code clean and readable, and in a 'standard' style. Many reviewers start by reading the test code, because that defines the *desired behaviour** of the code, rather than its mechanistic implementation. Code review can also be used to provide other developers with tips, tricks, or general praise when they do a good job.

## Testing strategies

Testing has become a staple of software development, and repository maintainers are likely to ask for tests evidencing that your feature code, or even bug fixes, perform the function that they are expected to perform.

We can classify testing into three categories:
- **Unit testing** where we test a small unit of code, typically a single function.
- **Integration testing** which tests how components link together and so involves multiple functions.
- **Regression testing** which tests whole workflows to ensure that our changes have not altered the output of our system on some known use-cases.

With unit testing, we attempt to show that the function performs a specific function (and also successfully fails in certain situations). In this way, developing appropriate tests allows us to *define the desired behaviour of the function*, providing a target specification for us when we write the function itself. Due to this, some people write their tests before writing any function code, while others employ iterative test-code-test strategies, such as Test-Driven-Development (TDD).

Whatever your chosen strategy, it is good practise to test your code with a small number of typical use cases, some edge cases, and to think about how your code would handle unexpected situations (such as text input instead of numeric).

## Using the `testthat` library

As with most languages, R offers testing through packaged add-ons, meaning that multiple options are available. A particularly popular framework for the R language is `testthat`. R functions and associated tests are available in this repository, though you are free to submit Pull Requests to add more.

As with most testing frameworks, it is good practise to keep your tests separate from your main code, by placing them into a different folder. The recommendation for `testthat` is to place your tests in a `tests/testthat` folder, and prepend each test script with `test_`.

Example:
```
repo
  ├── R
  │   └── sinc.R
  ├── tests
  │   └── testthat
  │       └── test_sinc.R
```

## Mocking functions for testing

Mocks allow us to override function calls that are 'within' other tested functions. This can be useful when the function you want to test makes use of database look-ups, relies on date-time information, or is computationally expensive.

An example of mocking is provided in the script [`R/salary.R`](https://github.com/jsbrittain/r-berlin/blob/main/R/salary.R). Here, we mocked obtaining the Gross salary of employee #id from payroll - this function could conceivably make use of a database look-up (which is slow, relies on the database being online/available, and is liable to change). In this case we override the output of that function from within the testing framework so as to return a controlled value.

```
GrossSalary <- function(id) { <Database lookup> }
NetSalary <- function(id, tax) { <Function we want to test but which calls GrossSalary> }

test_that("salary", {
  local_mock(GrossSalary = function(id) 100000)
  expect_equal(NetSalary(123,.2), 80000)
}
```

## A quick introduction to Github Actions

Github Actions allow us to automate certain functions at specified times, or when certain events trigger those actions. We made use of github actions to run our unit test suite when pushes or pull-requests were made on the main branch. Github actions are [YAML](https://circleci.com/blog/what-is-yaml-a-beginner-s-guide/?psafe_param=1&utm_source=google&utm_medium=sem&utm_campaign=sem-google-dg--emea-en-dsa-tROAS-auth-nb&utm_term=g_-_c__dsa_&utm_content=&gclid=CjwKCAjw0ZiiBhBKEiwA4PT9z_VjB8a_4tNAdkLE97O2n2QrGTOgwVl3ei7cXKR3OCsfHAKGiC9HvBoCRKAQAvD_BwE) files, stored in the `.github/workflows` folder, that configures a virtual machine on the github servers and executes arbitrary tasks, such as testing our software on a range of different operating systems and/or language version numbers.

To automate testing of our R functions (and remembering that the github virtual machines will not have the necessary packages pre-installed for our tests), we first created the file `run_test.R` to install the necessary libraries, and then run `testthat`. To run the test suite we use the command `testthat::test_dir("tests/testthat")` (this command also works if you want to run the tests yourself from the RStudio console).

Then, we created a new github action by selecting Actions from the repository homepage and creating a new workflow specific for R. We then made some minor changes to the provided YAML document (basically, removing the two commands to be executed, and replacing them with `RScript run_test.R` to execute our code. The full configuration is accessible from this repository ([.github/workflows/r.yml](https://github.com/jsbrittain/r-berlin/blob/main/.github/workflows/r.yml)).

Once the actions finished we were rewarded with the cherished green-tick. Clicking on the green-tick, then Details, opens information about the action, and clicking on the three-dots symbol on the right-hand side revealed the `Create badge status` options, which provides the markdown text that you can use to insert a status badge at the top of your repository's [README.md](https://github.com/jsbrittain/r-berlin/blob/main/README.md) file.

Github actions can be used for many different functions, including linting, code formatting, build processes, code coverage, etc. Linting in R can be achieved using the `lintr` package, code formatting by the `styler` package, and code-coverage by the `covr` package.
