---
layout: post
title:  "Post Title Here"
date:   2018-04-09
categories: Powershell automation exchange
tags: python, automation, data science
---

Recently I've been venturing more and more into the world of data science and machine learning, and I've come across a lot of helpful utilities that have made my world *way* easier.  I'm assuming, if you're reading this post about data science, that you've at least heard of [python](https://www.python.org/about/) and [Anaconda](https://www.anaconda.com/what-is-anaconda/) and why those are so useful.  This post won't cover python or Anaconda, but will move forward a bit and focus on organizing your projects.

I'd like to introduce my newest favorite github repo, [CookieCutter](https://github.com/drivendata/cookiecutter-data-science).  Installation is a breeze through anaconda, just use a simple `conda install` after adding the `conda-forge` channel:

![CookieCutter Installation Screenshot](/images/cookiecutter/install.png)

A few minutes later, you'll press `y` to confirm the changes that `conda install` wants to perform to your environment, and you'll be all set.

Moving forward, let's create our own data science project.  Thankfully, this is a simple one liner as well:

`cookiecutter https://github.com/drivendata/cookiecutter-data-science`

You'll then be asked a few pieces of information, as follows:

```
project_name:
repo_name:
author_name:
description:
Select open_source_license:
1 - MIT
2 - BSD-3-Clause
3 - No license file
Choose from 1, 2, 3:
s3_bucket:
aws_profile:
Select python_interpreter:
1 - python
2 - python3
Choose from 1, 2:
```

After filling out the appropriate info, you'll see that the console spits out information about the data structure that has been created.  You could poke around through all the files and folders, but I've found that the best overview for the stuff that's created is actually in the github's readme project here:

```
├── LICENSE
├── Makefile           <- Makefile with commands like `make data` or `make train`
├── README.md          <- The top-level README for developers using this project.
├── data
│   ├── external       <- Data from third party sources.
│   ├── interim        <- Intermediate data that has been transformed.
│   ├── processed      <- The final, canonical data sets for modeling.
│   └── raw            <- The original, immutable data dump.
│
├── docs               <- A default Sphinx project; see sphinx-doc.org for details
│
├── models             <- Trained and serialized models, model predictions, or model summaries
│
├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
│                         the creator's initials, and a short `-` delimited description, e.g.
│                         `1.0-jqp-initial-data-exploration`.
│
├── references         <- Data dictionaries, manuals, and all other explanatory materials.
│
├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
│   └── figures        <- Generated graphics and figures to be used in reporting
│
├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
│                         generated with `pip freeze > requirements.txt`
│
├── src                <- Source code for use in this project.
│   ├── __init__.py    <- Makes src a Python module
│   │
│   ├── data           <- Scripts to download or generate data
│   │   └── make_dataset.py
│   │
│   ├── features       <- Scripts to turn raw data into features for modeling
│   │   └── build_features.py
│   │
│   ├── models         <- Scripts to train models and then use trained models to make
│   │   │                 predictions
│   │   ├── predict_model.py
│   │   └── train_model.py
│   │
│   └── visualization  <- Scripts to create exploratory and results oriented visualizations
│       └── visualize.py
│
└── tox.ini            <- tox file with settings for running tox; see tox.testrun.org
```

Next, as with all great projects, we'll want to use a versioning control system like git.  To load the data science project to git, we'll use the following few commands:

`git init` <- this initializes the folder as a git repository.
`git add .` <- this adds all the files to the git repo
`git commit -m "initial commit"` <- this creates a git commit (think a "save point") to be loaded
`git remote add origin git@github.com:<username>/<repo>` <- this can be found in your github after you've created a new repository, and this configures git to add the "remote origin" which is basically where your data is "saved" in git.
`git push origin master` <- this loads all your data into git.

And there you have it!  We've officially created our first github data science project, using cookiecutter for templating.

Recently, I've undertaken the competition for [TalkingData AdTracking Fraud Detection](https://www.kaggle.com/c/talkingdata-adtracking-fraud-detection) on kaggle, and you can [view my github repository](https://github.com/mcdonaldbm/TalkingData-FraudDetection) that I've created using the steps in this article.

If you have any questions, or ideas for more posts like this, [tweet at me]((http://www.twitter.com/_brycemcdonald) or send me an email by clicking the link in the sidebar.